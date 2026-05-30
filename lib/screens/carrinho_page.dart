import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/carrinho_provider.dart';

import '../widgets/custom_app_bar.dart';

import '../screens/cliente_page.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinhoProvider = Provider.of<CarrinhoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const CustomAppBar(),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(26, 0, 26, 26),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Seu Carrinho",

                      style: TextStyle(
                        fontSize: 24,

                        fontWeight: FontWeight.w700,

                        color: Color(0xFF003B2F),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // =====================================
                    // CARRINHO VAZIO
                    // =====================================
                    if (carrinhoProvider.itens.isEmpty)
                      SizedBox(
                        height: 500,

                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Container(
                                width: 120,
                                height: 120,

                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,

                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.shopping_bag_outlined,

                                  size: 60,

                                  color: Color(0xFF4F735E),
                                ),
                              ),

                              const SizedBox(height: 30),

                              const Text(
                                "Carrinho vazio",

                                style: TextStyle(
                                  fontSize: 34,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 14),

                              Text(
                                "Adicione produtos do nosso catálogo para começar.",

                                style: TextStyle(
                                  fontSize: 20,

                                  color: Colors.grey.shade700,
                                ),
                              ),

                              const SizedBox(height: 40),

                              SizedBox(
                                width: 240,
                                height: 65,

                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0B4D2B),

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),

                                  child: const Text(
                                    "Ver catálogo",

                                    style: TextStyle(
                                      fontSize: 22,

                                      fontWeight: FontWeight.bold,

                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // =====================================
                    // COM ITENS
                    // =====================================
                    if (carrinhoProvider.itens.isNotEmpty)
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,

                            physics: const NeverScrollableScrollPhysics(),

                            itemCount: carrinhoProvider.itens.length,

                            itemBuilder: (context, index) {
                              final item = carrinhoProvider.itens[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 24),

                                padding: const EdgeInsets.all(18),

                                decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.circular(20),

                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,

                                      child: IconButton(
                                        onPressed: () {
                                          carrinhoProvider.removerItem(item);
                                        },

                                        icon: const Icon(
                                          Icons.delete_outline,

                                          color: Color(0xFF4F735E),
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(18),

                                        child: Image.asset(
                                          item.imagemProduto,

                                          height: 180,

                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),

                                    Text(
                                      item.nomeProduto,

                                      style: const TextStyle(
                                        fontSize: 22,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    Text(
                                      item.observacoes,

                                      style: TextStyle(
                                        fontSize: 15,

                                        color: Colors.grey.shade700,

                                        height: 1.6,
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    Text(
                                      "Quantidade: ${item.quantidade}",

                                      style: const TextStyle(fontSize: 15),
                                    ),

                                    const SizedBox(height: 20),

                                    Align(
                                      alignment: Alignment.centerRight,

                                      child: Text(
                                        "R\$ ${item.subtotal.toStringAsFixed(2).replaceAll(".", ",")}",

                                        style: const TextStyle(
                                          fontSize: 20,

                                          fontWeight: FontWeight.bold,

                                          color: Color(0xFF003B2F),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 20),

                          Container(
                            width: double.infinity,

                            padding: const EdgeInsets.all(24),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(28),

                              border: Border.all(color: Colors.grey.shade300),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                const Text(
                                  "Resumo",

                                  style: TextStyle(
                                    fontSize: 22,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 30),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    const Text(
                                      "Total",

                                      style: TextStyle(fontSize: 16),
                                    ),

                                    Text(
                                      "R\$ ${carrinhoProvider.total.toStringAsFixed(2).replaceAll(".", ",")}",

                                      style: const TextStyle(
                                        fontSize: 22,

                                        fontWeight: FontWeight.w700,

                                        color: Color(0xFF003B2F),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 30),

                                SizedBox(
  width: double.infinity,

  height: 56,

  child: ElevatedButton(
    onPressed: () {

      Navigator.push(
        context,

        MaterialPageRoute(
          builder: (context) => const ClientePage(),
        ),
      );
    },

    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF0B4D2B),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
    ),

    child: const Text(
      "Finalizar pedido",

      style: TextStyle(
        fontSize: 16,

        fontWeight: FontWeight.bold,

        color: Colors.white,
      ),
    ),
  ),
),

                                const SizedBox(height: 10),

                                const SizedBox(height: 10),

                                SizedBox(
                                  width: double.infinity,
                                  height: 56,

                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },

                                    style: ButtonStyle(
                                      overlayColor: WidgetStateProperty.all(
                                        Colors.black.withValues(alpha: 0.02),
                                      ),

                                      shadowColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                    ),

                                    child: const Text(
                                      "Continuar comprando",

                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0B4D2B),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
