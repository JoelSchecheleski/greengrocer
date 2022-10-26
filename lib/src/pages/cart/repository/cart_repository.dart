import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/result/cart_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  // Buscando dados do carinho
  Future<CartResult<List<CartItemModel>>> getCartItems({required String token, required String userId}) async { // <CartResult<List>>
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
}
