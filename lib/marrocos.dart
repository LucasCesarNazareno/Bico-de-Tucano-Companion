
import 'package:flutter/material.dart';

class MarrocosPage extends StatelessWidget {
  final Map<String, dynamic> fase;

  const MarrocosPage({
    super.key,
    required this.fase,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      appBar: AppBar(
        title: Text(fase["nome"]),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // IMAGEM GRANDE
            Image.asset(
              fase["imagem"],
              width: double.infinity,
              height: 420,
              fit: BoxFit.cover,
            ),

            // PAINEL DE INFORMAÇÕES
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
                    // NOME
                    Text(
                      fase["nome"],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // DESCRIÇÃO
                    Text(
                      fase["descricao"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF344C38),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // INFORMAÇÕES
                    Text(
                      fase["informacoes"] ?? "",
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
