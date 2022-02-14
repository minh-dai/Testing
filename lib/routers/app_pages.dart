import 'package:get/get.dart';
import 'package:test_fluter/features/product/detail/binding/product_detail_binding.dart';
import 'package:test_fluter/features/product/detail/product_detail_screen.dart';
import 'package:test_fluter/routers/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const ProductDetailScreen(),
      binding: ProductDetailBinding(),
    ),
  ];
}
