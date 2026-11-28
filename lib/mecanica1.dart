import 'package:flutter/material.dart';

class Mecanica1Page extends StatelessWidget {
  final Map<String, dynamic> mecanica;

  const Mecanica1Page({
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
            Image.asset(
              mecanica["imagem"],
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 15, 24, 35),
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
                    mecanica["titulo"],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF25492D),
                    ),
                  ),
                  if ((mecanica["descricao"] ?? "").toString().trim().isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Text(
                      mecanica["descricao"],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF344C38),
                        height: 1.5,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}