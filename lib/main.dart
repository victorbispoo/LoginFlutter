import 'package:flutter/material.dart';
import 'package:login_flutter/pages/login_page.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true
        ),
      home: const LoginPage(),
    );
  }
}