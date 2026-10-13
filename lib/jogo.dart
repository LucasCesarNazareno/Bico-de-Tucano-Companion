
import 'package:flutter/material.dart';

import 'main.dart';
import 'personagens.dart';
import 'fases.dart';
import 'mecanicas.dart';
import 'athenovie.dart';

class JogoPage extends StatelessWidget {
  const JogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      // APP BAR
      appBar: AppBar(
        title: const Text("Sobre o Jogo"),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),

      // CONTEÚDO DA PÁGINA
      body: SingleChildScrollView(
        child: Column(
          children: [
            // IMAGEM GRANDE
            Image.asset(
              "img/logoJogo.png",
              width: double.infinity,
              height: 420,
              fit: BoxFit.cover,
            ),

            // PAINEL SOBREPOSTO À IMAGEM
            Transform.translate(
              offset: const Offset(0, -25),

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 35),

                decoration: const BoxDecoration(
                  color: Color(0xFFFFE8CA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TÍTULO
                    Text(
                      "Bico de Tucano: O Legado de Tito",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    SizedBox(height: 5),
                    // INFORMAÇÕES SOBRE O JOGO
                    Text(
                      "texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo texto explicando o jogo ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF344C38),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
        currentIndex: 4,

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MecanicasPage(),
              ),
            );
          }

          // JOGO
          if (index == 4) {
            // Já estamos nesta página
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
