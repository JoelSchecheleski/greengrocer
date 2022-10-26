import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/result/cart_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  // Buscando dados do carinho
  Future getCartItems({required String token, required String userId}) async { // <CartResult<List>>
    final result = await _httpManager.restRequest(
      url: EndPoints.getCartItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'user': userId,
      },
    );

    print('Executou endpoint');
    if (result['result'] != null) {
      print(result['result']);
    } else {
      print('Ocorreu um erro ao recuperar os itens do carrinho');
    }
  }
}
