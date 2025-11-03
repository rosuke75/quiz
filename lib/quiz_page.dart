import 'package:flutter/material.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> preguntas = [
    {
      'texto': '¿Cuál es el planeta más cercano al Sol?',
      'opciones': ['Venus', 'Marte', 'Mercurio', 'Júpiter'],
      'respuesta': 2,
    },
    {
      'texto': '¿Quién escribió "Cien años de soledad"?',
      'opciones': [
        'Isabel Allende',
        'Gabriel García Márquez',
        'Pablo Neruda',
        'Mario Vargas Llosa'
      ],
      'respuesta': 1,
    },
    {
      'texto': '¿Cuál es el símbolo químico del oro?',
      'opciones': ['O', 'Ag', 'Au', 'Gd'],
      'respuesta': 2,
    },
  ];

  int indiceActual = 0;
  int puntaje = 0;

  void verificarRespuesta(int seleccionada) {
    if (seleccionada == preguntas[indiceActual]['respuesta']) {
      puntaje++;
    }

    if (indiceActual < preguntas.length - 1) {
      setState(() {
        indiceActual++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(puntaje: puntaje, total: preguntas.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pregunta = preguntas[indiceActual];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pregunta ${indiceActual + 1}/${preguntas.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              pregunta['texto'],
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 30),
            ...List.generate(pregunta['opciones'].length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ElevatedButton(
                  onPressed: () => verificarRespuesta(index),
                  child: Text(pregunta['opciones'][index]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
