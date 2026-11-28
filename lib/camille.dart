import 'package:flutter/material.dart';

class CamillePage extends StatefulWidget {
  final Map<String, dynamic> personagem;

  const CamillePage({
    super.key,
    required this.personagem,
  });

  @override
  State<CamillePage> createState() => _CamillePageState();
}

class _CamillePageState extends State<CamillePage> {
  int imagemAtual = 0;

  @override
  Widget build(BuildContext context) {
    final personagem = widget.personagem;

    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),
      appBar: AppBar(
        title: Text(personagem["nome"]),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 420,
              color: Colors.white,
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (index) {
                      setState(() => imagemAtual = index);
                    },
                    children: [
                      Image.asset(
                        personagem["imagem"],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        personagem["modelo"],
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 35,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: imagemAtual == index
                                ? const Color(0xFF25492D)
                                : Colors.grey.shade300,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      personagem["nome"],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),
                    Text(
                      personagem["descricao"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF344C38),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      personagem["informacoes"] ?? "",
                      style: const TextStyle(
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
    );
  }
}