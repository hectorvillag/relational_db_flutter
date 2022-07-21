import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/login_page.dart';
import 'package:relational_db_example/presentation/widgets/screen_container.dart';
import 'package:relational_db_example/presentation/widgets/steps_widget.dart';
import 'package:relational_db_example/presentation/widgets/outlined_button.dart'
    as button;

class FinalPage extends StatefulWidget {
  const FinalPage({Key? key}) : super(key: key);

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      header: const StepsWidget(
        steps: 4,
        currentStep: 4,
      ),
      contentColor: const Color(0xFF28AE54),
      content: Column(children: [_content()]),
    );
  }

  Widget _content() {
    final size = MediaQuery.of(context).size;
    return Container(
        margin:
            EdgeInsets.symmetric(vertical: 32.0, horizontal: size.width / 4),
        child: Column(
          children: [
            Text(
              'Registro creado exitosamente',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
            Image.asset('assets/ambulance.png'),
            button.OutlinedButton(
              enabled: true,
              text: 'Inicio',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
            )
          ],
        ));
  }
}
