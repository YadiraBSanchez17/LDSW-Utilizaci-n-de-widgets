import 'package:flutter/material.dart';

void main() {
  runApp(const GreenFlowWidgets());
}

class GreenFlowWidgets extends StatelessWidget {
  const GreenFlowWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseño de Aplicaciones Móviles',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WidgetScreen(),
    );
  }
}

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                    255,
                    255,
                    255,
                    0.08,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://images.pexels.com/photos/37010902/pexels-photo-37010902.jpeg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20),
                              color: Colors.white10,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.computer_rounded,
                                color: Colors.white,
                                size: 80,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Hello World',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Diseño de Aplicaciones Móviles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Actividad de Widgets Flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // ROW + ICONS
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [

                        Container(
                          padding:
                              const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.code_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 20),

                        Container(
                          padding:
                              const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.laptop_mac_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 20),

                        Container(
                          padding:
                              const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.rocket_launch_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    SizedBox(
                      width: 220,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:
                              const Color(0xFF198754),
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                        ),
                        label: const Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Utilización de widgets',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 13,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
