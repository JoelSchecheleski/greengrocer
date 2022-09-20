import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                  text: 'Green',
                  style: TextStyle(color: CustomColors.customSwatchColor)),
              TextSpan(
                  text: 'grocer',
                  style: TextStyle(color: CustomColors.customContrastColor)),
            ],
          ),
        ),
        // actions
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                // position: BadgePosition.topEnd(top: 10, end: 10),
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: "Pesquisar",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
          )

          // Categorias

          // Grid
        ],
      ),
    );
  }
}
/**
 * leading: Badge(
    position: BadgePosition.topEnd(top: 10, end: 10),
    badgeContent: null,
    child: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
    ),
    ), *
 */
