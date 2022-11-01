import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/orders/result/orders_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class OrdersRepository {
  final _httpManager = HttpManager();

  // Busca todos os pedidos para o usuário
  Future<OrdersResult<List<OrderModel>>> getAllOrders({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getOrders,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'user': userId,
      },
    );

    if (result['result'] != null) {
      List<OrderModel> orders =
          List<Map<String, dynamic>>.from(result['result'])
              .map(OrderModel.fromJson)
              .toList();
      return OrdersResult<List<OrderModel>>.success(orders);
    } else {
      return OrdersResult.error('Não foi possível obter a lista de pedidos');
    }
  }

  // Busca todos os itens de um pedido
  Future<OrdersResult<List<CartItemModel>>> getOrderItems({
    required String token,
    required String orderId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getOrderItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {
        'orderId': orderId,
      },
    );
    if (result['result'] != null) {
      List<CartItemModel> items =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();
      return OrdersResult.success(items);
    } else {
      return OrdersResult.error(
          'Não foi possível recuperar os produtos do pedido');
    }
  }
}
