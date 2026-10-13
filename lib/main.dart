
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'personagens.dart';
import 'fases.dart';
import 'mecanicas.dart';
import 'jogo.dart';
import 'athenovie.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bico de Tucano Companion",
      home: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List inicio = [];

  @override
  void initState() {
    super.initState();
    carregarJson();
  }

  Future<void> carregarJson() async {
    String dados =
        await rootBundle.loadString('assets/inicio.json');

    setState(() {
      inicio = json.decode(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [

              // FUNDO CREME
              Positioned.fill(
                child: Container(
                  color: const Color(0xFFFFE8CA),
                ),
              ),

              // CONTEÚDO DA TELA
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      // LOGO E CAMADA CREME SOBREPOSTA
                      Stack(
                        clipBehavior: Clip.none,
                        children: [

                          // LOGO SEM CANTOS ARREDONDADOS
                          Image.asset(
                            'img/LogoBicoTucano.jpg',
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),

                          // FUNDO CREME SOBRE A PARTE INFERIOR DA LOGO
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -1,
                            child: Container(
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFE8CA),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // CARDS NA MESMA ÁREA CREME
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFFFE8CA),
                        child: Column(
                          children: [

                            const SizedBox(height: 20),

                            // CARDS DO JSON
                            ...inicio.asMap().entries.map((item) {
                              int index = item.key;
                              var dados = item.value;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 7,
                                ),

                                child: GestureDetector(
                                  onTap: () {

                                    // PERSONAGENS
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PersonagensPage(),
                                          settings: const RouteSettings(
                                            arguments: 'Personagens',
                                          ),
                                        ),
                                      );
                                    }

                                    // FASES E RECEITAS
                                    if (index == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const FasesPage(),
                                          settings: const RouteSettings(
                                            arguments: 'Fases e Receitas',
                                          ),
                                        ),
                                      );
                                    }

                                    // MECÂNICAS
                                    if (index == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MecanicasPage(),
                                          settings: const RouteSettings(
                                            arguments: 'Mecânicas',
                                          ),
                                        ),
                                      );
                                    }

                                    // SOBRE O JOGO
                                    if (index == 3) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const JogoPage(),
                                          settings: const RouteSettings(
                                            arguments: 'Sobre o Jogo',
                                          ),
                                        ),
                                      );
                                    }

                                    // ATHENOVIE
                                    if (index == 4) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AthenoviePage(),
                                          settings: const RouteSettings(
                                            arguments: 'Athenovie',
                                          ),
                                        ),
                                      );
                                    }
                                  },

                                  child: Container(
                                    width: double.infinity,
                                    height: 105,

                                    decoration: BoxDecoration(
                                      color: const Color(0xFF25492D)
                                          .withValues(alpha: 0.40),
                                      borderRadius:
                                          BorderRadius.circular(15),
                                    ),

                                    child: Row(
                                      children: [

                                        // IMAGEM DO CARD
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          child: Image.asset(
                                            dados["imagem"],
                                            width: 105,
                                            height: 105,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        const SizedBox(width: 12),

                                        // TÍTULO E DESCRIÇÃO
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [

                                              Text(
                                                dados["titulo"],
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color:
                                                      Color(0xFF25492D),
                                                ),
                                              ),

                                              const SizedBox(height: 5),

                                              Text(
                                                dados["descricao"],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      Color(0xFF344C38),
                                                  height: 1.3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const Padding(
                                          padding:
                                              EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Color(0xFF25492D),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),

      // BARRA DE NAVEGAÇÃO INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor: const Color(0xFF25492D),
        selectedItemColor: const Color(0xFFFFCB68),
        unselectedItemColor: const Color(0xFFE0E8DF),

        selectedFontSize: 10,
        unselectedFontSize: 10,

        showSelectedLabels: true,
        showUnselectedLabels: true,

        currentIndex: 0,

        onTap: (index) {

          // INÍCIO
          if (index == 0) {
            // Já estamos na tela inicial
          }

          // PERSONAGENS
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const PersonagensPage(),
                settings: const RouteSettings(
                  arguments: 'Personagens',
                ),
              ),
            );
          }

          // FASES E RECEITAS
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const FasesPage(),
                settings: const RouteSettings(
                  arguments: 'Fases e Receitas',
                ),
              ),
            );
          }

          // MECÂNICAS
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MecanicasPage(),
                settings: const RouteSettings(
                  arguments: 'Mecânicas',
                ),
              ),
            );
          }

          // SOBRE O JOGO
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const JogoPage(),
                settings: const RouteSettings(
                  arguments: 'Sobre o Jogo',
                ),
              ),
            );
          }

          // ATHENOVIE
          if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AthenoviePage(),
                settings: const RouteSettings(
                  arguments: 'Athenovie',
                ),
              ),
            );
          }
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Início",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: "Personagens",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.public_outlined),
            activeIcon: Icon(Icons.public),
            label: "Fases",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports_outlined),
            activeIcon: Icon(Icons.sports_esports),
            label: "Mecânicas",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: "Jogo",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            activeIcon: Icon(Icons.more),
            label: "Athenovie",
          ),
        ],
      ),
    );
  }
}
