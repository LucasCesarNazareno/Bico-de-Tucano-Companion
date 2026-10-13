
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'personagens.dart';
import 'fases.dart';
import 'jogo.dart';
import 'athenovie.dart';

import 'mecanica1.dart';
import 'mecanica2.dart';
import 'mecanica3.dart';
import 'mecanica4.dart';

class MecanicasPage extends StatefulWidget {
  const MecanicasPage({super.key});

  @override
  State<MecanicasPage> createState() => _MecanicasPageState();
}

class _MecanicasPageState extends State<MecanicasPage> {
  List mecanicas = [];

  @override
  void initState() {
    super.initState();
    carregarJson();
  }

  Future<void> carregarJson() async {
    String dados =
        await rootBundle.loadString('assets/mecanicas.json');

    if (!mounted) return;

    setState(() {
      mecanicas = json.decode(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      appBar: AppBar(
        title: const Text("Mecânicas"),
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
        elevation: 1,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),

            ...mecanicas.asMap().entries.map((item) {
              int index = item.key;
              var dados = item.value;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 7,
                ),

                child: GestureDetector(
                  onTap: () {
                    // MECÂNICA 1
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Mecanica1Page(mecanica: dados),
                        ),
                      );
                    }

                    // MECÂNICA 2
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Mecanica2Page(mecanica: dados),
                        ),
                      );
                    }

                    // MECÂNICA 3
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Mecanica3Page(mecanica: dados),
                        ),
                      );
                    }

                    // MECÂNICA 4
                    if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Mecanica4Page(mecanica: dados),
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
                        // IMAGEM DA MECÂNICA
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

                        // TÍTULO E DESCRIÇÃO
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                dados["titulo"],
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
        currentIndex: 3,

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PersonagensPage(),
              ),
            );
          }

          // FASES
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
            // Já estamos nesta tela
          }

          // JOGO
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
