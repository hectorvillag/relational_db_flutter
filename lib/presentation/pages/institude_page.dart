import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/service_data_page.dart';
import 'package:relational_db_example/presentation/widgets/form_footer.dart';
import 'package:relational_db_example/presentation/widgets/screen_container.dart';
import 'package:relational_db_example/presentation/widgets/step_counter.dart';
import 'package:relational_db_example/presentation/widgets/step_title.dart';
import 'package:relational_db_example/presentation/widgets/steps_widget.dart';

class InstitutePage extends StatefulWidget {
  const InstitutePage({Key? key}) : super(key: key);

  @override
  State<InstitutePage> createState() => _InstitutePageState();
}

class _InstitutePageState extends State<InstitutePage> {
  final institutes = ['Cruz Roja', 'Secretaria de salud', 'EMI', 'Sura'];

  int? _value;

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      header: const StepsWidget(
        steps: 4,
        currentStep: 0,
      ),
      content: Column(children: [
        const StepCounter(currentStep: 1, nSteps: 4),
        const StepTitle(title: 'Institucion que asiste'),
        _options()
      ]),
      footer: FormFooter(withBackButton: false, onNext: _onNext),
    );
  }

  Widget _options() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < institutes.length; i++)
            _instituteWidget(i, institutes[i]),
        ],
      ),
    );
  }

  Widget _instituteWidget(int key, String label) {
    return Container(
        height: 60.0,
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
        child: Row(
          children: [
            Radio(
              value: key,
              onChanged: (value) {
                setState(() {
                  _value = key;
                });
              },
              groupValue: _value,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: Text(label),
            )
          ],
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(25))));
  }

  void _onNext() {
    if (_value != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const ServiceDataPage())));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Seleciona una institucion')));
    }
  }
}
