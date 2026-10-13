
import 'package:flutter/material.dart';

class Mecanica3Page extends StatelessWidget {
  final Map<String, dynamic> mecanica;

  const Mecanica3Page({
    super.key,
    required this.mecanica,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      appBar: AppBar(
        title: Text(mecanica["titulo"]),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // IMAGEM GRANDE
            Image.asset(
              mecanica["imagem"],
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
                    // TÍTULO
                    Text(
                      mecanica["titulo"],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // DESCRIÇÃO
                    Text(
                      mecanica["descricao"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF344C38),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // INFORMAÇÕES
                    Text(
                      mecanica["informacoes"] ?? "",
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
