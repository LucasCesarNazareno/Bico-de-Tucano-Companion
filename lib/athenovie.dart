
import 'package:flutter/material.dart';

import 'main.dart';
import 'personagens.dart';
import 'fases.dart';
import 'mecanicas.dart';
import 'jogo.dart';

class AthenoviePage extends StatelessWidget {
  const AthenoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      appBar: AppBar(
        title: const Text("Athenovie"),
        centerTitle: true,
        backgroundColor: const Color(0xFF7B2FBE),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // IMAGEM GRANDE
            Image.asset(
              "img/logoAthenovie.png",
              width: double.infinity,
              height: 420,
              fit: BoxFit.cover,
            ),

            Transform.translate(
              offset: const Offset(0, -25),

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 35),

                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sobre a Athenovie",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B2FBE),
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Tecnologia pensada para a sua vida",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF7B2FBE),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa Informações da empresa ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF343434),
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

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF7B2FBE),
        selectedItemColor: const Color(0xFFFFCB68),
        unselectedItemColor: const Color(0xFFEDE0F7),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 5,

        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainApp(),
              ),
            );
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PersonagensPage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FasesPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MecanicasPage(),
              ),
            );
          }

          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const JogoPage(),
              ),
            );
          }

          if (index == 5) {
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
