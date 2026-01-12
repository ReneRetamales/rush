import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: const SafeArea(
        child: Center(
          child: Text('Pantalla de crear cuenta (en construcción)'),
        ),
      ),
    );
  }
}
