import 'package:flutter/material.dart';
import 'package:menu_drawer/quiz_page.dart';
import 'inicio.dart';
import 'configuraciones.dart';
import 'buscar.dart';
import 'historial.dart';
import 'quiz_page.dart'; // ✅ Importa tu pantalla de quiz

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Cierra el Drawer
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Deseas salir?'),
        content: const Text('Esto te llevará a la pantalla de inicio.'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Salir'),
            onPressed: () {
              Navigator.pop(context); // Cierra el diálogo
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const InicioPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú principal'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Troy'),
              accountEmail: const Text('troy@example.com'),
              currentAccountPicture: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage("images/conejo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Inicio'),
                    onTap: () => _navigateTo(context, const InicioPage()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.search),
                    title: const Text('Buscar'),
                    onTap: () => _navigateTo(context, const BuscarPage()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('Historial'),
                    onTap: () => _navigateTo(context, const HistorialPage()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.quiz),
                    title: const Text('Quiz'),
                    onTap: () => _navigateTo(
                      context,
                      const QuizPage(),
                    ), // ✅ Aquí se abre el quiz
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: 'Configuración',
                    onPressed: () =>
                        _navigateTo(context, const ConfiguracionPage()),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    icon: const Icon(Icons.logout),
                    label: const Text('Salir'),
                    onPressed: () => _confirmLogout(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Selecciona una opción del menú',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
