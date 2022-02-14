import 'package:get/get.dart';
import 'package:test_fluter/models/product/product_detail_model.dart';
import 'package:test_fluter/models/product/product_extra_item_model.dart';
import 'package:test_fluter/services/product/product_detail_repository.dart';

class ProductDetailController extends GetxController {
  final ProductDetailRepository repository;
  var productDetailModel = ProductDetailModel.empty().obs;
  final selectedQuantity = 1.obs;
  final selectedExtras = List<ProductExtraItemModel>.empty().obs;

  ProductDetailController(this.repository) {
    _initData();
  }

  double totalPrice() {
    final priceOption =
        selectedExtras.isNotEmpty ? double.parse(selectedExtras[0].price) : 0;
    return productDetailModel.value.price * selectedQuantity.value +
        priceOption;
  }

  void _initData() async {
    final productDetailResponse = await repository.getProductDetail();
    productDetailModel.value = productDetailResponse;
  }
}
