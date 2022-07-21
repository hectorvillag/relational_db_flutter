import 'package:flutter/material.dart';

class StepsWidget extends StatelessWidget {
  final int currentStep;
  final int steps;

  const StepsWidget({Key? key, required this.currentStep, required this.steps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stepWidgets = <Widget>[];

    for (int i = 0; i < steps; i++) {
      stepWidgets.add(_circle(
        context,
        currentStep == i,
        i < currentStep,
      ));

      if (i < (steps - 1)) {
        stepWidgets.add(_line(context, currentStep > i));
      }
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: stepWidgets),
    );
  }

  Widget _circle(BuildContext context, bool current, bool completed) {
    print('circle $current $completed');

    const _completedSize = 20.0;
    const _incompleteSize = 16.0;

    return Container(
      height: completed ? _completedSize : _incompleteSize,
      width: completed ? _completedSize : _incompleteSize,
      child: completed
          ? const Icon(
              Icons.done,
              color: Colors.white,
              size: 14.0,
            )
          : null,
      decoration: BoxDecoration(
          color: completed
              ? Theme.of(context).primaryColor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              width: 3,
              color: completed || current
                  ? Theme.of(context).primaryColor
                  : const Color(0xFFA9DCBD))),
    );
  }

  Widget _line(BuildContext context, bool active) {
    return Expanded(
        child: Container(
      height: active ? 4.0 : 3.0,
      color: active ? Theme.of(context).primaryColor : const Color(0xFFA9DCBD),
    ));
  }
}
