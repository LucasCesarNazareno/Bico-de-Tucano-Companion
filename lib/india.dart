
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chana.dart';

class IndiaPage extends StatefulWidget {
  final Map<String, dynamic> fase;

  const IndiaPage({
    super.key,
    required this.fase,
  });

  @override
  State<IndiaPage> createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
  List receitas = [];

  @override
  void initState() {
    super.initState();
    carregarJson();
  }

  Future<void> carregarJson() async {
    String dados =
        await rootBundle.loadString('assets/receitas.json');

    if (!mounted) return;

    setState(() {
      receitas = json.decode(dados)
          .where((receita) => receita["pais"] == "India")
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8CA),

      appBar: AppBar(
        title: Text(widget.fase["nome"]),
        centerTitle: true,
        backgroundColor: const Color(0xFF25492D),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.fase["imagem"],
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
                      widget.fase["nome"],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25492D),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      widget.fase["descricao"] ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF344C38),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      widget.fase["informacoes"] ?? "",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF344C38),
                        height: 1.6,
                      ),
                    ),

                    if (receitas.isNotEmpty) ...[
                      const SizedBox(height: 30),

                      const Text(
                        "Receitas desta fase",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF25492D),
                        ),
                      ),

                      const SizedBox(height: 15),

                      ...receitas.map((receita) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),

                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    ChanaPage(receita: receita),
                                ),
                              );
                            },

                            child: Container(
                              height: 95,
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
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                    child: Image.asset(
                                      receita["imagem"],
                                      width: 95,
                                      height: 95,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Text(
                                      receita["nome"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF25492D),
                                      ),
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
                    ],
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
