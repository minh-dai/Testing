// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_extra_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExtraModel _$ProductExtraModelFromJson(Map<String, dynamic> json) =>
    ProductExtraModel(
      id: json['id'] as int,
      name: json['name'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
    );

Map<String, dynamic> _$ProductExtraModelToJson(ProductExtraModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'min': instance.min,
      'max': instance.max,
    };
