import 'package:get/get.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/orders/repository/orders_respository.dart';
import 'package:greengrocer/src/pages/orders/result/orders_result.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class OrderController extends GetxController {
  List<OrderModel> allOrders = [];
  final orderRepository = OrdersRepository();
  final authController = Get.find<AuthController>();
  final utilsService = UtilsServices();

  @override
  void onInit() {
    super.onInit();
    getAllOrders();
  }

  // Obtem a lista de pedidos do usuário
  Future<void> getAllOrders() async {
    OrdersResult<List<OrderModel>> result = await orderRepository.getAllOrders(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
    result.when(
      success: (orders) {
        allOrders = orders;
        update();
      },
      error: (message) {
        utilsService.showToast(message: message, isError: true);
      },
    );
  }
}
