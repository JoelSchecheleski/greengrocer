
import 'package:greengrocer/src/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  String title;
  String description;
  double price;
  String unit;
  String picture;
  CategoryModel? category;

  ItemModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.price,
    required this.unit,
    required this.picture,
    this.category,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel{id: $id, title: $title, picture: $picture, unit: $unit, price: $price, description: $description}';
  }
}
