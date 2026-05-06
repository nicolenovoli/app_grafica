import 'package:flutter/material.dart';

import 'produto_item.dart';

class SecaoProdutos extends StatelessWidget {
  const SecaoProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [

          // TOPO
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                'Para sua Marca',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B4D2B),
                ),
              ),

              Text(
                '6 ITENS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // LISTA
          const ProdutoItem(
            nome: 'Panfletos',
            descricao:
                'Divulgação rápida e impactante',
            preco: 'a partir de R\$ 120,00',
            imagem: 'assets/panfletos.png',
          ),

          ProdutoItem(
            nome: 'Pastas Personalizadas',
            descricao:
                'Apresentação corporativa elegante',
            preco: 'a partir de R\$ 320,00',
            imagem: 'assets/pastas.png',
          ),

          ProdutoItem(
            nome: 'Cartazes',
            descricao:
                'Alto impacto visual',
            preco: 'a partir de R\$ 45,00',
            imagem: 'assets/cartazes.png',
          ),

          ProdutoItem(
            nome: 'Folders',
            descricao:
                'Material informativo dobrado',
            preco: 'a partir de R\$ 180,00',
            imagem: 'assets/folders.png',
          ),

          ProdutoItem(
            nome: 'Etiquetas Adesivas',
            descricao:
                'Diversos formatos e materiais',
            preco: 'a partir de R\$ 65,00',
            imagem: 'assets/etiquetas.png',
          ),

          ProdutoItem(
            nome: 'Receituário Médico',
            descricao:
                'Blocos personalizados para clínicas',
            preco: 'a partir de R\$ 75,00',
            imagem: 'assets/receituario.png',
          ),
        ],
      ),
    );
  }
}