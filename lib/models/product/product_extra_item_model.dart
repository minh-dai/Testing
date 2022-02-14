import 'package:json_annotation/json_annotation.dart';

part 'product_extra_item_model.g.dart';

@JsonSerializable(
  createToJson: true,
  createFactory: true,
)

class ProductExtraItemModel {
  final int id;
  final String name;
  @JsonKey(name: 'extra_id')
  final int extraId;
  final String price;

  ProductExtraItemModel({
    required this.id,
    required this.name,
    required this.extraId,
    required this.price,
  });

  Map<String, dynamic> toJson() => _$ProductExtraItemModelToJson(this);

  factory ProductExtraItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProductExtraItemModelFromJson(json);
}
