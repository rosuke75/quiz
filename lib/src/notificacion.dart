import 'package:flutter/material.dart';
import 'navbar.dart';
import 'buscar.dart';

class NotificacionPage extends StatelessWidget {
  const NotificacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus Notificaciones'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.notifications_active, size: 80, color: Colors.redAccent),
              const SizedBox(height: 20),
              const Text(
                'Aquí verás todas tus alertas y notificaciones.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cargar Notificaciones'),
              ),
            ],
          ),
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
