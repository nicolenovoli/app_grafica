import 'package:flutter/material.dart';

class ProdutoDestaque extends StatelessWidget {
  const ProdutoDestaque({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(24),

      child: Container(

        height: 420,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(38),

          boxShadow: [

            BoxShadow(

              color: Colors.black.withValues(alpha: 0.12),

              blurRadius: 30,

              offset: const Offset(0, 12),
            ),
          ],

          image: const DecorationImage(

            image: AssetImage(
              "assets/cartao.jpg",
            ),

            fit: BoxFit.cover,
          ),
        ),

        child: Container(

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(38),

            gradient: LinearGradient(

              begin: Alignment.topLeft,

              end: Alignment.bottomCenter,

              colors: [

                Colors.black.withValues(alpha: 0.55),

                Colors.black.withValues(alpha: 0.18),

                Colors.black.withValues(alpha: 0.72),
              ],
            ),
          ),

          child: Padding(

            padding: const EdgeInsets.all(34),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              mainAxisAlignment:
                  MainAxisAlignment.end,

              children: [


                Container(

                  padding:
                      const EdgeInsets.symmetric(

                    horizontal: 18,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(40),
                  ),

                  child: const Text(

                    'MAIS VENDIDO',

                    style: TextStyle(

                      color: Color(0xFF0B4D2B),

                      fontWeight: FontWeight.bold,

                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 24),


                const Text(

                  'Cartões de Visita',

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 42,

                    fontWeight: FontWeight.bold,

                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 14),


                const Text(

                  'Impressão profissional\ncom acabamento premium.',

                  style: TextStyle(

                    color: Colors.white70,

                    fontSize: 18,

                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 28),


                Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    const Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(

                          'A partir de',

                          style: TextStyle(

                            color: Colors.white60,

                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(

                          'R\$ 89,90',

                          style: TextStyle(

                            color: Colors.white,

                            fontSize: 28,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}