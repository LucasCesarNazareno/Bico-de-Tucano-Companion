
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'fases.dart';
import 'mecanicas.dart';
import 'jogo.dart';
import 'athenovie.dart';

import 'lucas.dart';
import 'tito.dart';
import 'camille.dart';
import 'elena.dart';
import 'hassan.dart';
import 'pryia.dart';
import 'matteo.dart';

class PersonagensPage extends StatefulWidget {
  const PersonagensPage({super.key});

  @override
  State<PersonagensPage> createState() =>
      _PersonagensPageState();
}

class _PersonagensPageState extends State<PersonagensPage> {
  List personagens = [];

  @override
  void initState() {
    super.initState();
    carregarJson();
  }

  Future<void> carregarJson() async {
    String dados =
        await rootBundle.loadString('assets/personagens.json');

    setState(() {
      personagens = json.decode(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      appBar: AppBar(
        title: const Text("Personagens"),
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
        elevation: 1,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),

            ...personagens.asMap().entries.map((item) {
              int index = item.key;
              var dados = item.value;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 7,
                ),

                child: GestureDetector(
                  onTap: () {

                    // LUCAS
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LucasPage(personagem: dados),
                        ),
                      );
                    }

                    // VÔ TITO
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TitoPage(personagem: dados),
                        ),
                      );
                    }

                    // HASSAN
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HassanPage(personagem: dados),
                        ),
                      );
                    }

                    // PRYIA
                    if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PryiaPage(personagem: dados),
                        ),
                      );
                    }

                    // CAMILLE
                    if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CamillePage(personagem: dados),
                        ),
                      );
                    }

                    // ELENA
                    if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ElenaPage(personagem: dados),
                        ),
                      );
                    }

                    // MATTEO
                    if (index == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MatteoPage(personagem: dados),
                        ),
                      );
                    }
                  },

                  child: Container(
                    width: double.infinity,
                    height: 110,

                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE8CA),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFF25492D)
                            .withValues(alpha: 0.20),
                      ),
                    ),

                    child: Row(
                      children: [
                        // IMAGEM DO PERSONAGEM
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),

                          child: Image.asset(
                            dados["imagem"],
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // NOME E DESCRIÇÃO
                        Expanded(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                dados["nome"],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF25492D),
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                dados["descricao"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF344C38),
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(right: 10),
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
        currentIndex: 1,

        onTap: (index) {

          // INÍCIO
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainApp(),
              ),
            );
          }

          // PERSONAGENS
          if (index == 1) {
            // Já estamos nesta tela
          }

          // FASES E RECEITAS
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FasesPage(),
              ),
            );
          }

          // MECÂNICAS
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MecanicasPage(),
              ),
            );
          }

          // SOBRE O JOGO
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const JogoPage(),
              ),
            );
          }

          // ATHENOVIE
          if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AthenoviePage(),
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
