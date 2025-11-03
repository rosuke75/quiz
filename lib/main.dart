import 'package:flutter/material.dart';
import 'package:menu_drawer/quiz_page.dart';
import 'package:menu_drawer/src/navbar.dart';
import 'package:menu_drawer/src/inicio.dart';
import 'package:menu_drawer/src/buscar.dart';
import 'package:menu_drawer/src/historial.dart';
import 'package:menu_drawer/src/configuraciones.dart';
import 'package:menu_drawer/src/quiz_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/inicio': (context) => const InicioPage(),
        '/buscar': (context) => const BuscarPage(),
        '/historial': (context) => const HistorialPage(),
        '/configuracion': (context) => const ConfiguracionPage(),
        '/quiz': (context) => const QuizPage(), // si usas la trivia
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Navegación de Drawer App'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          "Página Principal",
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
