import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/patient_page.dart';
import 'package:relational_db_example/presentation/widgets/form_footer.dart';
import 'package:relational_db_example/presentation/widgets/screen_container.dart';
import 'package:relational_db_example/presentation/widgets/step_counter.dart';
import 'package:relational_db_example/presentation/widgets/step_title.dart';
import 'package:relational_db_example/presentation/widgets/steps_widget.dart';

class ServiceDataPage extends StatefulWidget {
  const ServiceDataPage({Key? key}) : super(key: key);

  @override
  State<ServiceDataPage> createState() => _ServiceDataPageState();
}

class _ServiceDataPageState extends State<ServiceDataPage> {
  static const reasons = <String>['Médica', 'Quirúrgica', 'Ginecoobstetricia'];
  String? _reasonValue;

  final _formKey = GlobalKey<FormState>();

  final _dateController = TextEditingController();

  final _ambulanceCodeController = TextEditingController();

  final _addressController = TextEditingController();

  final _defaultMargin =
      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        header: const StepsWidget(
          steps: 4,
          currentStep: 1,
        ),
        content: Column(children: [
          const StepCounter(currentStep: 2, nSteps: 4),
          const StepTitle(title: 'Datos del servicio'),
          _form()
        ]),
        footer: FormFooter(
          withBackButton: true,
          onNext: _onNext,
          onBack: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child:
          Column(children: [_ambulanceCode(), _date(), _reason(), _address()]),
    );
  }

  Widget _ambulanceCode() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration: const InputDecoration(labelText: 'Código Ambulancia'),
          controller: _ambulanceCodeController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce el código de ambulancia';
            }
          }),
    );
  }

  Widget _date() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Fecha',
          ),
          readOnly: true,
          onTap: () async {
            final result = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 7)),
                lastDate: DateTime.now());
            if (result != null) {
              setState(() {
                String convertedDateTime =
                    "${result.year.toString()}-${result.month.toString().padLeft(2, '0')}-${result.day.toString().padLeft(2, '0')}";
                _dateController.text = convertedDateTime;
              });
            }
          },
          controller: _dateController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce la Fecha';
            }
          }),
    );
  }

  Widget _reason() {
    return Container(
      margin: _defaultMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Motivo asistencia',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          DropdownButton<String>(
            isExpanded: true,
            value: _reasonValue,
            hint: const Text('Selecciona'),
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _reasonValue = newValue!;
              });
            },
            items: reasons.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _address() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration:
              const InputDecoration(labelText: 'Dirección de la asistencia'),
          controller: _addressController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce la dirección de la asistencia';
            }
          }),
    );
  }

  void _onNext() {
    if (_formKey.currentState!.validate() && _reasonValue != null) {
      print('Form valido');
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return const PatientPage();
      })));
    } else if (_reasonValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Seleciona un Motivo de asistencia')));
    }
  }
}
