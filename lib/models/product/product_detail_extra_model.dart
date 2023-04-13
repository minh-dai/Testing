import 'package:json_annotation/json_annotation.dart';

part 'product_detail_extra_model.g.dart';

@JsonSerializable(
  createToJson: true,
  createFactory: true,
)

class ProductExtraModel {
  
  final int id;
  final String name;
  final String min;
  final String max;

  ProductExtraModel({
    required this.id,
    required this.name,
    required this.min,
    required this.max,
  });

  Map<String, dynamic> toJson() => _$ProductExtraModelToJson(this);

  factory ProductExtraModel.fromJson(Map<String, dynamic> json) =>
      _$ProductExtraModelFromJson(json);
}
