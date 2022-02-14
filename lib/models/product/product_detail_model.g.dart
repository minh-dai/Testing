// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      fullDescription: json['full_description'] as String,
      images: json['images'] == null
          ? null
          : ProductDetailImage.fromJson(json['images'] as Map<String, dynamic>),
      extras: (json['extras'] as List<dynamic>?)
          ?.map((e) => ProductExtraModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      extraItems: (json['extra_items'] as List<dynamic>?)
          ?.map(
              (e) => ProductExtraItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'full_description': instance.fullDescription,
      'images': instance.images,
      'extras': instance.extras,
      'extra_items': instance.extraItems,
    };
