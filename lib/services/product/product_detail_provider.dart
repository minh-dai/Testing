import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:test_fluter/core/untils/api_constants.dart';
import 'package:test_fluter/models/product/product_detail_model.dart';

class ProductDetailProvider extends GetConnect {
  Future<Response<ProductDetailModel>> getProductDetail() => get(
    Api.urlProductDetail,
    decoder: (data) => ProductDetailModel.fromJson(jsonDecode(data)),
  );
}
