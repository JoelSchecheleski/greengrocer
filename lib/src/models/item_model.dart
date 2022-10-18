
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  String title;
  String picture;
  String unit;
  double price;
  String description;

  ItemModel({
    this.id = '',
    required this.title,
    required this.picture,
    required this.unit,
    required this.price,
    required this.description,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel{id: $id, title: $title, picture: $picture, unit: $unit, price: $price, description: $description}';
  }
}
