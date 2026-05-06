import 'package:flutter/material.dart';

class ProdutoItem extends StatelessWidget {
  final String nome;
  final String descricao;
  final String preco;
  final String imagem;

  const ProdutoItem({
    super.key,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 22,
      ),
      child: Row(
        children: [

          // IMAGEM
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagem,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          // TEXTO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B4D2B),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  preco,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B4D2B),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // BOTÃO +
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Color(0xFF0B4D2B),
            ),
          ),
        ],
      ),
    );
  }
}