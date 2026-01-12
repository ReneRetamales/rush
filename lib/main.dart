import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_flow.dart';
import 'screens/home/home_screen.dart';
import 'screens/map/map_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'widgets/app_navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rush - Plantilla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterChoiceScreen(),
        '/register/client/name': (context) => const ClientNameScreen(),
        '/register/client/email': (context) => const ClientEmailScreen(),
        '/register/client/password': (context) => const ClientPasswordScreen(),
        '/register/professional/business': (context) =>
            const ProfBusinessNameScreen(),
        '/register/professional/type': (context) => const ProfTypeScreen(),
        '/register/professional/filters': (context) =>
            const ProfFiltersScreen(),
        '/register/professional/email': (context) => const ProfEmailScreen(),
        '/register/professional/password': (context) =>
            const ProfPasswordScreen(),
        '/home': (context) => MainNavigation(),
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  static const List<String> _titles = ['Inicio', 'Mapa', 'Perfil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentIndex == 0 || _currentIndex == 1)
          ? null
          : AppBar(title: Text(_titles[_currentIndex])),
      body: IndexedStack(
        index: _currentIndex,
        children: const [HomeScreen(), MapScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: AppNavbar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
      ),
    );
  }
}
