import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/institude_page.dart';
import 'package:relational_db_example/presentation/widgets/rounded_button.dart';
import 'package:relational_db_example/presentation/widgets/screen_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        headerColor: const Color(0xFF28AE54),
        content: Column(
            children: [_loginForm(), _forgotPasswordLink(), _tycLink()]));
  }

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _title(),
            _inputEmail(),
            _inputPassword(),
            _loginButton(),
          ],
        ));
  }

  Widget _inputEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          controller: _emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Introduce el email';
            }
          }),
    );
  }

  Widget _inputPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(labelText: 'Password'),
        controller: _passwordController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Introduce el password';
          }
        },
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: const EdgeInsets.only(top: 32.0),
      child: Text(
        'PreHospital Care',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
      text: 'Login',
      onTap: () {
        if (_formKey.currentState!.validate()) {
          print('form data');
          print(_emailController.text);
          print(_passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return const InstitutePage();
          })));
        } else {
          print('invalid form');
        }
      },
      enabled: true,
      margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
    );
  }

  Widget _forgotPasswordLink() {
    return InkWell(
      onTap: () {
        print('forgot password');
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.caption,
          )),
    );
  }

  Widget _tycLink() {
    return InkWell(
      onTap: () {
        print('tyc');
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Privacy',
            style: Theme.of(context).textTheme.caption,
          )),
    );
  }
}
