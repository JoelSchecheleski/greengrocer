import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class CartTabScreen extends StatefulWidget {
  const CartTabScreen({Key? key}) : super(key: key);

  @override
  State<CartTabScreen> createState() => _CartTabScreenState();
}

class _CartTabScreenState extends State<CartTabScreen> {
  final UtilsServices utilsServices = UtilsServices();

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          // Lista de itens do carrinho
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                if (controller.cartItems.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        size: 40,
                        color: CustomColors.customSwatchColor,
                      ),
                      const Text('Não há itens no carrinho'),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      cartItem: controller.cartItems[index],
                      // appData.cartItems[index],
                      // remove: removeItemFromCart,
                    );
                  },
                );
              },
            ),
          ),

          // Caso tenha alguma coisa no carrinho então apresenta todos os componentes
          // senão aprenseta somente um Container()
          GetBuilder<CartController>(builder: (controller) {
            return controller.cartItems.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 3,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Total geral",
                          style: TextStyle(
                            fontFamily: 'IndieFlower',
                            fontSize: 12,
                          ),
                        ),
                        GetBuilder<CartController>(
                          builder: (controller) {
                            return Text(
                              utilsServices
                                  .priceToCurrency(controller.cartTotalPrice()),
                              style: TextStyle(
                                fontSize: 23,
                                color: CustomColors.customSwatchColor,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 50,
                          child: GetBuilder<CartController>(
                            builder: (controller) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: CustomColors.customSwatchColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: controller.isCheckoutLoading
                                    ? null
                                    : () async {
                                        // confirmar se deseja finalizar
                                        bool? result =
                                            await showOrderConfirmation();
                                        if (result ?? false) {
                                          controller.checkoutCart();
                                        } else {
                                          utilsServices.showToast(
                                              message: 'Pedido não confirmado');
                                        }
                                      },
                                child: controller.isCheckoutLoading
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        "Concluir pedido",
                                        style: TextStyle(fontSize: 18),
                                      ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Container();
          }),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Confirmação"),
          content: const Text("Deseja realmente concluir o pedido?"),
          actions: [
            TextButton(
              onPressed: () {
                //
                Navigator.of(context).pop(false);
              },
              child: const Text("Não"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                //
                Navigator.of(context).pop(true);
              },
              child: const Text("Sim"),
            ),
          ],
        );
      },
    );
  }
}
