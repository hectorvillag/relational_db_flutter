import 'package:flutter/material.dart';

class StepCounter extends StatelessWidget {
  final int currentStep;
  final int nSteps;

  const StepCounter({Key? key, required this.currentStep, required this.nSteps})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        alignment: Alignment.bottomLeft,
        child: Text('Paso $currentStep de $nSteps',
            style: Theme.of(context).textTheme.subtitle2));
  }
}
