import 'package:flutter/material.dart';
// ...existing code...

/// Pantalla principal con barra de navegación inferior
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(child: PlaceholderTemplate()));
  }
}

/// Widget reutilizable con ejemplos de texto y botón (usado en Home)
class PlaceholderTemplate extends StatelessWidget {
  const PlaceholderTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Plantilla base',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Edita `lib/main.dart` para empezar a personalizar tu app.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Botón presionado')));
          },
          child: const Text('Probar acción'),
        ),
      ],
    );
  }
}
