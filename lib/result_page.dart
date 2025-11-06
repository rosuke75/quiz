import 'package:flutter/material.dart';
import 'package:menu_drawer/src/inicio.dart';


class ResultPage extends StatelessWidget {
  final int puntaje;
  final int total;

  const ResultPage({
    super.key,
    required this.puntaje,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    String mensajeFinal;
    if (puntaje == total) {
      mensajeFinal = '¡Perfecto! ';
    } else if (puntaje >= total / 2) {
      mensajeFinal = '¡Buen trabajo! ';
    } else {
      mensajeFinal = 'Sigue practicando ';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mensajeFinal,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Tu puntaje: $puntaje / $total',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.restart_alt),
              label: const Text('Volver al inicio'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
