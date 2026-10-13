
import 'package:flutter/material.dart';

class PizzaPage extends StatelessWidget {
  final Map<String, dynamic> receita;

  const PizzaPage({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      appBar: AppBar(
        title: Text(receita["nome"]),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              receita["imagem"],
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

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receita["nome"],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      receita["pais"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF667466),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      receita["descricao"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF344C38),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Massa",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...List<String>.from(
                      receita["Massa"] ?? [],
                    ).map((ingrediente) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "• $ingrediente",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF344C38),
                            height: 1.5,
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 25),

                    const Text(
                      "Recheio",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...List<String>.from(
                      receita["Recheio"] ?? [],
                    ).map((ingrediente) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "• $ingrediente",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF344C38),
                            height: 1.5,
                          ),
                        ),
                      );
                    }),
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
