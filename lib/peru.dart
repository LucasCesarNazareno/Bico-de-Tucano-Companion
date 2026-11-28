import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ceviche.dart';

class PeruPage extends StatefulWidget {
  final Map<String, dynamic> fase;

  const PeruPage({
    super.key,
    required this.fase,
  });

  @override
  State<PeruPage> createState() => _PeruPageState();
}

class _PeruPageState extends State<PeruPage> {
  List receitas = [];
  int imagemAtual = 0;

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
          .where((receita) => receita["pais"] == "Peru")
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
            Container(
              height: 260,
              color: Colors.white,
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (index) {
                      setState(() => imagemAtual = index);
                    },
                    children: [
                      Image.asset(
                        widget.fase["imagem"],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "img/ModeloPeru.png",
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
                                      CevichePage(receita: receita),
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