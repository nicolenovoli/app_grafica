import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/carrinho_page.dart';

import '../screens/orders_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30),

      child: Row(
        children: [
          // =====================================
          // LOGO
          // =====================================
          ClipRRect(
            borderRadius: BorderRadius.circular(18),

            child: Image.asset(
              "assets/logo.png",

              width: 65,
              height: 75,

              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 18),

          // =====================================
          // TEXTO
          // =====================================
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "BEM-VINDO À",

                  style: TextStyle(
                    fontSize: 12,

                    color: Colors.black54,

                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Gráfica Pergaminho",

                  style: TextStyle(
                    fontSize: 28,

                    fontWeight: FontWeight.bold,

                    color: Color(0xFF0B4D2B),
                  ),
                ),
              ],
            ),
          ),

          // =====================================
          // MENU
          // =====================================
          Row(
            children: [
              // CATÁLOGO
              _menuItem(titulo: "CATÁLOGO", ativo: true),

              const SizedBox(width: 30),

              // PEDIDOS
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(builder: (_) => const OrdersPage()),
                  );
                },

                child: _menuItem(titulo: "PEDIDOS", ativo: true),
              ),

              const SizedBox(width: 30),

              // =====================================
              // BOTÃO CARRINHO
              // =====================================
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(builder: (_) => const CarrinhoPage()),
                  );
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFF0B4D2B),

                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: const Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: Colors.white),

                      SizedBox(width: 10),

                      Text(
                        "CARRINHO",

                        style: TextStyle(
                          color: Colors.white,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({required String titulo, bool ativo = false}) {
    return Text(
      titulo,

      style: TextStyle(
        fontSize: 15,

        fontWeight: FontWeight.bold,

        color: ativo ? const Color(0xFF0B4D2B) : Colors.black54,
      ),
    );
  }
}
