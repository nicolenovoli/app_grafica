import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [

          // LOGO
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/placeholder.png",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // TEXTO
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'BEM-VINDO À',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Gráfica Pergaminho',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B4D2B),
                  ),
                ),
              ],
            ),
          ),

          // CARRINHO
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFF0B4D2B),
            ),
          ),
        ],
      ),
    );
  }
}