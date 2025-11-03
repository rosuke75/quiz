import 'package:flutter/material.dart';
import 'navbar.dart';
import 'buscar.dart';

class ConfiguracionPage extends StatelessWidget {
  const ConfiguracionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
        backgroundColor: const Color.fromARGB(255, 43, 41, 39),
      ),
      body: const Center(
        child: Text(
          'Ajusta las configuraciones de tu aplicación aquí.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Navbar()),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text('Inicio'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BuscarPage()),
                );
              },
              icon: const Icon(Icons.search),
              label: const Text('Buscar'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
