
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
      appBar: AppBar(
        title: const Text("Sobre o Jogo"),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "img/logoJogo.png",
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
                  color: Color(0xFFFFE8CA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bico de Tucano: O Legado de Tito",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Oii jogador! Tudo bem? \n\nPara você que ainda não conhece o noss jogo Bico de Tucano, vai aqui um pequeno spoiler dessa aventura incrível:\n\nTudo começa no Brasil, onde conhecemos Lucas, um jovem apaixonado por culinária que trabalha no restaurante de sua família, fundado por seu querido avô Tito.\n\nApós a morte de seu avô e as dificuldades enfrentadas pelo restaurante, Lucas encontra um antigo diário azul que guarda as histórias e aventuras de Tito pelo mundo. Inspirado por suas lembranças, nosso brasileirinho decide seguir os passos do avô e embarcar em uma viagem por diferentes países, conhecendo novas culturas, fazendo amizades e descobrindo sabores incríveis.\n\nDo Peru ao Marrocos, Lucas vive experiências que transformam sua maneira de enxergar a culinária e o fazem descobrir muito mais sobre o veganismo e sobre si mesmo.\n\nMas será que todas essas aventuras serão suficientes para salvar o restaurante da família? Prepare as malas e venha acompanhar essa jornada cheia de sabores, descobertas e histórias em Bico de Tucano: O Legado de Tito!\n\nE para você que já jogou o Bico de Tucano, e com certeza amou, está convidado a jogar de novo com um amigo que ainda não conhece o nosso jogo😊 ",
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
          }

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
