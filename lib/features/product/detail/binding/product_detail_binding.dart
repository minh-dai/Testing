import 'package:get/get.dart';
import 'package:test_fluter/features/product/detail/controller/product_detail_controller.dart';
import 'package:test_fluter/services/product/product_detail_provider.dart';
import 'package:test_fluter/services/product/product_detail_repository.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
          () => ProductDetailController(
            ProductDetailRepository(ProductDetailProvider()),
      ),
    );
  }
}
