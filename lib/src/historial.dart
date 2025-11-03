import 'package:flutter/material.dart';

class HistorialPage extends StatelessWidget {
  static final List<String> historialResultados = [];

  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de victorias')),
      body: ListView.builder(
        itemCount: historialResultados.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: Text(historialResultados[index]),
          );
        },
      ),
    );
  }
}
