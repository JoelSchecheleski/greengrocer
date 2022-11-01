import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/orders/components/order_tile.dart';
import 'package:greengrocer/src/pages/orders/controller/order_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: GetBuilder<OrderController>(
        builder: (controller) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemBuilder: (_, index) =>
                OrderTile(order: controller.allOrders[index]),
            itemCount: controller.allOrders.length,
          );
        },
      ),
    );
  }
}
