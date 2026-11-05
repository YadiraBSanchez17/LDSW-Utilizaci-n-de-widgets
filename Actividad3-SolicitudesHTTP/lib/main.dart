import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const GreenTechApp());
}

class GreenTechApp extends StatelessWidget {
  const GreenTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peticiones HTTP',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nombre = '';
  String imagen = '';
  int altura = 0;
  int peso = 0;
  bool cargando = false;

  Future<void> obtenerPokemon() async {
    setState(() {
      cargando = true;
    });

    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        nombre = data['name'];
        altura = data['height'];
        peso = data['weight'];
        imagen = data['sprites']['front_default'];
        cargando = false;
      });
    } else {
      setState(() {
        cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF0F3D2E),
              Color(0xFF198754),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.catching_pokemon,
                    size: 70,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Peticiones HTTP con Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Consumo de datos desde Internet usando PokéAPI',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Esta aplicación realiza una petición HTTPS para obtener información de un Pokémon utilizando una API pública.',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: obtenerPokemon,
                    child: const Text(
                      'Consultar Pokémon',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                if (cargando)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                if (nombre.isNotEmpty)
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.network(
                            imagen,
                            height: 150,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            nombre.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Altura: $altura',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Peso: $peso',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
