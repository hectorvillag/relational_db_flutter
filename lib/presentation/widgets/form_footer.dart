import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/widgets/rounded_button.dart';
import 'package:relational_db_example/presentation/widgets/outlined_button.dart'
    as back_button;

class FormFooter extends StatefulWidget {
  const FormFooter(
      {Key? key, required this.onNext, this.withBackButton = true, this.onBack})
      : super(key: key);

  final Function() onNext;

  final bool withBackButton;
  final Function()? onBack;

  @override
  State<FormFooter> createState() => _FormFooterState();
}

class _FormFooterState extends State<FormFooter> {
  @override
  Widget build(BuildContext context) {
    return _footer();
  }

  Widget _footer() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_backButton(), _nextButton()]);
  }

  Widget _nextButton() {
    return RoundedButton(
      margin: const EdgeInsets.only(top: 24.0, right: 12.0),
      width: (MediaQuery.of(context).size.width / 2) - 24.0,
      text: 'Siguiente',
      onTap: widget.onNext,
      enabled: true,
    );
  }

  Widget _backButton() {
    if (widget.withBackButton) {
      return back_button.OutlinedButton(
          margin: const EdgeInsets.only(top: 24.0, left: 12.0),
          width: (MediaQuery.of(context).size.width / 2) - 24.0,
          text: 'Anterior',
          onTap: widget.onBack!,
          enabled: true);
    }
    return Container();
  }
}
