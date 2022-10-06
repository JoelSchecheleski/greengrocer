import 'package:greengrocer/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  List<CartItemModel> items;
  DateTime overdueDateTime;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
