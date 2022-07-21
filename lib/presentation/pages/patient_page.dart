import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/cause_page.dart';
import 'package:relational_db_example/presentation/widgets/form_footer.dart';
import 'package:relational_db_example/presentation/widgets/screen_container.dart';
import 'package:relational_db_example/presentation/widgets/step_counter.dart';
import 'package:relational_db_example/presentation/widgets/step_title.dart';
import 'package:relational_db_example/presentation/widgets/steps_widget.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  static const genders = <String>['Masculino', 'Femenino'];
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _addressController = TextEditingController();

  final _phoneController = TextEditingController();

  String? _genderValue;

  final _defaultMargin =
      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        header: const StepsWidget(
          steps: 4,
          currentStep: 2,
        ),
        content: Column(children: [
          const StepCounter(currentStep: 3, nSteps: 4),
          const StepTitle(title: 'Paciente'),
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
      child: Column(children: [
        _name(),
        Row(
          children: [Expanded(child: _gender()), Expanded(child: _age())],
        ),
        _address(),
        _phone()
      ]),
    );
  }

  Widget _name() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration: const InputDecoration(labelText: 'Nombre'),
          controller: _nameController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce el nombre';
            }
          }),
    );
  }

  Widget _gender() {
    return Container(
      margin: _defaultMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Motivo asistencia',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          DropdownButton<String>(
            isExpanded: true,
            value: _genderValue,
            hint: const Text('Selecciona'),
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _genderValue = newValue!;
              });
            },
            items: genders.map<DropdownMenuItem<String>>((String value) {
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

  Widget _age() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration: const InputDecoration(labelText: 'Edad'),
          controller: _ageController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce la edad';
            }
          }),
    );
  }

  Widget _address() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration: const InputDecoration(labelText: 'Dirección'),
          controller: _addressController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce la dirección';
            }
          }),
    );
  }

  Widget _phone() {
    return Container(
      margin: _defaultMargin,
      child: TextFormField(
          decoration: const InputDecoration(labelText: 'Telefono'),
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce el telefono';
            }
          }),
    );
  }

  void _onNext() {
    if (_formKey.currentState!.validate() && _genderValue != null) {
      print('Form valido');
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return CausePage();
      })));
    } else if (_genderValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Seleciona el Sexo')));
    }
  }
}
