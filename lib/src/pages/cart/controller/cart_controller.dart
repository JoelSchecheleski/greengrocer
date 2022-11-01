import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/cart/repository/cart_repository.dart';
import 'package:greengrocer/src/pages/cart/result/cart_result.dart';
import 'package:greengrocer/src/pages/cart/result/checkout_result.dart';
import 'package:greengrocer/src/pages/common_widgets/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class CartController extends GetxController {
  final cartRespository = CartRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];
  bool isCheckoutLoading = false;

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  double cartTotalPrice() {
    double total = 0;
    for (final item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  // Obtem a lista de itens do carrinho
  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRespository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    result.when(
      success: (data) {
        cartItems = data;
        update();
      },
      error: (message) {
        utilsServices.showToast(message: message);
      },
    );
  }

  int getItemIdex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  // Adiciona novo item no carrinho
  Future<void> addItemToCart({
    required ItemModel item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIdex(item);
    if (itemIndex >= 0) {
      // Se já existe soma a quantidade
      final product = cartItems[itemIndex];
      await changeItemQuantity(
          item: product, quantity: (product.quantity + quantity));
    } else {
      // Se não existe adiciona no carrinhho
      final CartResult<String> result = await cartRespository.addItemToCart(
        userId: authController.user.id!,
        token: authController.user.token!,
        productId: item.id,
        quantity: quantity,
      );
      result.when(
        success: (cartItemId) {
          cartItems.add(
            CartItemModel(
              id: cartItemId,
              item: item,
              quantity: quantity,
            ),
          );
        },
        error: (message) {
          utilsServices.showToast(message: message, isError: true);
        },
      );
    }
    update();
  }

  // Alterar a quantidade de itens no carrinho
  Future<bool> changeItemQuantity({
    required CartItemModel item,
    required int quantity,
  }) async {
    final result = await cartRespository.changeItemQuantity(
      token: authController.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );

    if (result) {
      if (quantity == 0) {
        cartItems.removeWhere((element) => element.id == item.id);
      } else {
        cartItems.firstWhere((element) => element.id == item.id).quantity =
            quantity;
      }
    } else {
      utilsServices.showToast(
        message: 'Ocorreu um erro ao tentar alterar a quantidade do produto',
        isError: true,
      );
    }
    update();
    return result;
  }

  // Finalizar pedido, mas pode ser usado um CartResult
  Future<void> checkoutCart() async {
    setCheckoutLoading(true);
    CheckoutResult<OrderModel> result = await cartRespository.checkoutCart(
      token: authController.user.token!,
      total: cartTotalPrice(),
    );
    setCheckoutLoading(false);

    result.when(
      success: (order) {
        cartItems.clear();
        update();

        // chama a tela para apresentar o pedido
        showDialog(
            context: Get.context!,
            builder: (_) {
              return PaymentDialog(
                order: order,
              );
            });
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
    update();
  }

  void setCheckoutLoading(bool value) {
    isCheckoutLoading = value;
    update();
  }
}
