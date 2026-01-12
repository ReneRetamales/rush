import 'package:flutter/material.dart';

/// Pantalla de perfil completa (usada por la ruta `/perfil`)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    // appBar: AppBar(title: const Text('Perfil texto de mierda')),
    body: SafeArea(child: const ProfileContent()),
  );
}

/// Contenido de perfil (sin Scaffold) para usar dentro del layout principal
class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const SizedBox(height: 16),
          // Aquí puedes añadir más opciones de perfil
          const Expanded(child: Center(child: Text('Aquí va el perfil'))),
          ElevatedButton.icon(
            onPressed: () {
              // Cerrar sesión: redirige a la pantalla de login
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text('Cerrar sesión'),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
