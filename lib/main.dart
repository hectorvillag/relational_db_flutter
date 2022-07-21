import 'package:flutter/material.dart';
import 'package:relational_db_example/presentation/pages/login_page.dart';
import 'package:relational_db_example/presentation/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Relational DB demo', theme: appTheme, home: const LoginPage());
  }
}
