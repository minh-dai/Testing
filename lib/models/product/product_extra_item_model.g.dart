// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_extra_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExtraItemModel _$ProductExtraItemModelFromJson(
        Map<String, dynamic> json) =>
    ProductExtraItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      extraId: json['extra_id'] as int,
      price: json['price'] as String,
    );

Map<String, dynamic> _$ProductExtraItemModelToJson(
        ProductExtraItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'extra_id': instance.extraId,
      'price': instance.price,
    };
