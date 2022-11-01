import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/cart/result/cart_result.dart';
import 'package:greengrocer/src/pages/cart/result/checkout_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  // Buscando dados do carinho
  Future<CartResult<List<CartItemModel>>> getCartItems(
      {required String token, required String userId}) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getCartItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'user': userId,
      },
    );
    if (result['result'] != null) {
      List<CartItemModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CartItemModel.fromJson)
              .toList();
      return CartResult<List<CartItemModel>>.success(data);
    } else {
      return CartResult.error(
          'Ocorreu um erro inesperado ao recuperar itens do carrinho!');
    }
  }

  // Add item no carrinho
  Future<CartResult<String>> addItemToCart({
    required String userId,
    required String token,
    required String productId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.addItemToCart,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'user': userId,
        'quantity': quantity,
        'productId': productId,
      },
    );
    if (result['result'] != null) {
      return CartResult<String>.success(result['result']['id']);
    } else {
      return CartResult.error('Não foi possível adicionar item no carrinho');
    }
  }

  // Alterar a quantidade de itens no carrinho
  Future<bool> changeItemQuantity({
    required String token,
    required String cartItemId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.modifyItemQuantity,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'cartItemId': cartItemId,
        'quantity': quantity,
      },
    );
    return result.isEmpty;
  }

  // Finalizar pedido, mas pode ser usado um CartResult
  Future<CheckoutResult<OrderModel>> checkoutCart({
    required String token,
    required double total,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.checkout,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'total': total,
      },
    );
    if (result['result'] != null) {
      final order = OrderModel.fromJson(result['result']);
      return CheckoutResult<OrderModel>.success(order);
    } else {
      return CheckoutResult.error('Não foi possível realizar o pedido');
    }
  }
}
