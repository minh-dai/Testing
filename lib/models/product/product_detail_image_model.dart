import 'package:json_annotation/json_annotation.dart';

part 'product_detail_image_model.g.dart';

@JsonSerializable(
  createToJson: true,
  createFactory: true,
)
class ProductDetailImage {
  @JsonKey(name: 'full_size')
  final String fullSize;
  final String thumbnail;

  ProductDetailImage({
    required this.fullSize,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => _$ProductDetailImageToJson(this);

  factory ProductDetailImage.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailImageFromJson(json);
}
