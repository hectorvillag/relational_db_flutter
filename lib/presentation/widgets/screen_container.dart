import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer(
      {Key? key,
      this.headerColor = _defaultBackgroundColor,
      this.footer,
      this.header,
      this.contentColor = Colors.white,
      required this.content})
      : super(key: key);
  final Color headerColor;
  final Widget? footer;
  final Widget content;
  final Widget? header;
  final Color contentColor;

  static const _defaultBackgroundColor = Color(0xFFF2F9F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _defaultBackgroundColor,
        body: Stack(
          children: [
            _header(context),
            SingleChildScrollView(
              child: Column(
                children: [_headerSpacer(context), _content(), _footer()],
              ),
            )
          ],
        ));
  }

  Widget _header(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(height: (size.height / 6) + 35.0, color: headerColor);
  }

  Widget _headerSpacer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(height: size.height / 6, child: header);
  }

  Widget _content() {
    return Container(
      constraints:
          const BoxConstraints(minHeight: 500, minWidth: double.infinity),
      decoration: BoxDecoration(
          color: contentColor,
          border: Border.all(
            color: contentColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.3),
            ),
          ]),
      child: content,
    );
  }

  Widget _footer() {
    if (footer != null) {
      return footer!;
    }
    return Container();
  }
}
