import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/final_page.dart';
import 'package:relational_db_example/presentation/widgets/form_footer.dart';
import 'package:relational_db_example/presentation/widgets/screen_container.dart';
import 'package:relational_db_example/presentation/widgets/step_counter.dart';
import 'package:relational_db_example/presentation/widgets/step_title.dart';
import 'package:relational_db_example/presentation/widgets/steps_widget.dart';

class CausePage extends StatefulWidget {
  const CausePage({Key? key}) : super(key: key);

  @override
  State<CausePage> createState() => _CausePageState();
}

class _CausePageState extends State<CausePage> {
  List checkListItems = [
    {'value': false, 'text': 'Arma de fuego'},
    {'value': false, 'text': 'Arma blanca'},
    {'value': false, 'text': 'Automotor'},
    {'value': false, 'text': 'Caída'},
    {'value': false, 'text': 'Vapuleado'},
    {'value': false, 'text': 'Quemadura'},
    {'value': false, 'text': 'Mordedura'}
  ];

  List multipleSelected = [];

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        header: const StepsWidget(
          steps: 4,
          currentStep: 3,
        ),
        content: Column(children: [
          const StepCounter(currentStep: 4, nSteps: 4),
          const StepTitle(title: 'Causa Traumática'),
          _options()
        ]),
        footer: FormFooter(
          withBackButton: true,
          onNext: _onNext,
          onBack: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _options() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
          children: List.generate(
              checkListItems.length,
              (index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    activeColor: Theme.of(context).primaryColor,
                    dense: true,
                    title: Text(
                      checkListItems[index]["text"],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    value: checkListItems[index]["value"],
                    onChanged: (value) {
                      setState(() {
                        checkListItems[index]["value"] = value;
                        if (multipleSelected.contains(checkListItems[index])) {
                          multipleSelected.remove(checkListItems[index]);
                        } else {
                          multipleSelected.add(checkListItems[index]);
                        }
                      });
                      print(multipleSelected);
                    },
                  ))),
    );
  }

  void _onNext() {
    if (multipleSelected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Seleciona al menos una causa')));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const FinalPage())));
    }
  }
}
