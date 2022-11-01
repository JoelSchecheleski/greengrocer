import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;
  double total;
  String qrCodeImage;

  @JsonKey(name: 'copiaecola')
  String copyAndPaste;

  @JsonKey(name: 'due')
  DateTime overdueDateTime; // due

  String status;

  DateTime? createdDateTime;

  @JsonKey(defaultValue: [])
  List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.total,
    required this.qrCodeImage,
    required this.copyAndPaste,
    required this.overdueDateTime,
    required this.status,
    required this.createdDateTime,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  String toString() {
    return 'OrderModel{id: $id, total: $total, qrCodeImage: $qrCodeImage, '
        'copyAndPaste: $copyAndPaste, overdueDateTime: $overdueDateTime, '
        'status: $status, createdDateTime: $createdDateTime, items: $items}';
  }
}
