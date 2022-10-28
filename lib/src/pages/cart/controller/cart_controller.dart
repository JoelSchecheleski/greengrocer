import 'package:get/get.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/cart/repository/cart_repository.dart';
import 'package:greengrocer/src/pages/cart/result/cart_result.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class CartController extends GetxController {
  final cartRespository = CartRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

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
    return cartItems.indexWhere((itemInList) => itemInList.id == item.id);
  }

  // Adiciona novo item no carrinho
  Future<void> addItemToCart({
    required ItemModel item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIdex(item);
    if (itemIndex >= 0) {
      // Se já existe soma a quantidade
      cartItems[itemIndex].quantity += quantity;
    } else {
      // Se não existe adiciona no carrinhho
      final CartResult<String> result = await cartRespository.addItemToCart(
        userId: authController.user.id!,
        token: authController.user.token!,
        productId: item.id,
        quantity: quantity,
      );
      result.when(success: (cartItemId) {
        cartItems.add(
          CartItemModel(
            id: cartItemId,
            item: item,
            quantity: quantity,
          ),
        );
      }, error: (message) {
        utilsServices.showToast(message: message, isError: true);
      });
    }
  }
}
