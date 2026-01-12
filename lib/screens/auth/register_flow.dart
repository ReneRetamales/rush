import 'package:flutter/material.dart';

/// Pantallas del flujo de registro (cliente y profesional)

// 1) Elección de tipo de cuenta
class RegisterChoiceScreen extends StatelessWidget {
  const RegisterChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿Qué tipo de cuenta deseas crear?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/register/client/name'),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Cuenta de cliente')),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/register/professional/business',
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Cuenta de profesional')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Cliente (a) ----------------
class ClientNameScreen extends StatefulWidget {
  const ClientNameScreen({super.key});

  @override
  State<ClientNameScreen> createState() => _ClientNameScreenState();
}

class _ClientNameScreenState extends State<ClientNameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName1 = TextEditingController();
  final _lastName2 = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName1.dispose();
    _lastName2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nombre de usuario')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstName,
                  decoration: const InputDecoration(labelText: 'Primer nombre'),
                ),
                TextFormField(
                  controller: _lastName1,
                  decoration: const InputDecoration(
                    labelText: 'Primer apellido',
                  ),
                ),
                TextFormField(
                  controller: _lastName2,
                  decoration: const InputDecoration(
                    labelText: 'Segundo apellido (opcional)',
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Atrás'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/register/client/email',
                        ),
                        child: const Text('Siguiente'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientEmailScreen extends StatefulWidget {
  const ClientEmailScreen({super.key});

  @override
  State<ClientEmailScreen> createState() => _ClientEmailScreenState();
}

class _ClientEmailScreenState extends State<ClientEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Correo electrónico')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Correo'),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Atrás'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/register/client/password',
                        ),
                        child: const Text('Siguiente'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientPasswordScreen extends StatefulWidget {
  const ClientPasswordScreen({super.key});

  @override
  State<ClientPasswordScreen> createState() => _ClientPasswordScreenState();
}

class _ClientPasswordScreenState extends State<ClientPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _createAccount() {
    // En el MVP solo navegamos a home y limpiamos el historial
    // para que no aparezca el botón de regresar.
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear contraseña')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _password,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirm,
                  obscureText: _obscure,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar contraseña',
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Atrás'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _createAccount,
                        child: const Text('Crear cuenta'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- Profesional (b) ----------------
class ProfBusinessNameScreen extends StatefulWidget {
  const ProfBusinessNameScreen({super.key});

  @override
  State<ProfBusinessNameScreen> createState() => _ProfBusinessNameScreenState();
}

class _ProfBusinessNameScreenState extends State<ProfBusinessNameScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nombre del negocio/servicio')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                  labelText: 'Nombre del negocio o servicio',
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Atrás'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/register/professional/type',
                      ),
                      child: const Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfTypeScreen extends StatefulWidget {
  const ProfTypeScreen({super.key});

  @override
  State<ProfTypeScreen> createState() => _ProfTypeScreenState();
}

class _ProfTypeScreenState extends State<ProfTypeScreen> {
  String _selection = 'independiente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tipo de negocio/servicio')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              RadioListTile<String>(
                value: 'independiente',
                groupValue: _selection,
                title: const Text('Independiente'),
                onChanged: (v) => setState(() => _selection = v!),
              ),
              RadioListTile<String>(
                value: 'empresa',
                groupValue: _selection,
                title: const Text('Empresa'),
                onChanged: (v) => setState(() => _selection = v!),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Atrás'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/register/professional/filters',
                      ),
                      child: const Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfFiltersScreen extends StatelessWidget {
  const ProfFiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtros (temporal)')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Aquí se agregarán filtros más adelante. Por ahora pulsa Siguiente.',
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Atrás'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/register/professional/email',
                      ),
                      child: const Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfEmailScreen extends StatefulWidget {
  const ProfEmailScreen({super.key});

  @override
  State<ProfEmailScreen> createState() => _ProfEmailScreenState();
}

class _ProfEmailScreenState extends State<ProfEmailScreen> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Correo electrónico')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Correo'),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Atrás'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/register/professional/password',
                      ),
                      child: const Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfPasswordScreen extends StatefulWidget {
  const ProfPasswordScreen({super.key});

  @override
  State<ProfPasswordScreen> createState() => _ProfPasswordScreenState();
}

class _ProfPasswordScreenState extends State<ProfPasswordScreen> {
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _createAccount() {
    // Limpiar historial y navegar a home para evitar botón atrás
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear contraseña')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _password,
                obscureText: _obscure,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _confirm,
                obscureText: _obscure,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Atrás'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _createAccount,
                      child: const Text('Crear cuenta'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
