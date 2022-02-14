import 'package:json_annotation/json_annotation.dart';
import 'package:test_fluter/models/product/product_detail_extra_model.dart';
import 'package:test_fluter/models/product/product_detail_image_model.dart';
import 'package:test_fluter/models/product/product_extra_item_model.dart';

part 'product_detail_model.g.dart';

@JsonSerializable(
  createToJson: true,
  createFactory: true,
)
class ProductDetailModel {
  final int id;
  final String name;
  final double price;
  final String description;
  @JsonKey(name: 'full_description')
  final String fullDescription;
  final ProductDetailImage? images;
  final List<ProductExtraModel>? extras;
  @JsonKey(name: 'extra_items')
  final List<ProductExtraItemModel>? extraItems;

  ProductDetailModel.empty({
    this.id = -1,
    this.name = '',
    this.price = -1,
    this.description = '',
    this.fullDescription = '',
    this.images,
    this.extras,
    this.extraItems,
  });

  ProductDetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.fullDescription,
    required this.images,
    required this.extras,
    required this.extraItems,
  });

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
}
