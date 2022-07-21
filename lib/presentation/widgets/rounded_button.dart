import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.enabled,
      this.margin,
      this.width = double.infinity,
      this.height,
      this.padding =
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      this.color = const Color(0xFF28AE54)})
      : super(key: key);

  final String text;
  final Function() onTap;
  final bool enabled;
  final Color color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : () {},
      child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(25)))),
    );
  }
}
