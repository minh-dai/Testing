import 'package:test_fluter/models/product/product_detail_model.dart';
import 'package:test_fluter/services/product/product_detail_provider.dart';

class ProductDetailRepository {
  final ProductDetailProvider productProvider;

  ProductDetailRepository(this.productProvider);

  Future<ProductDetailModel> getProductDetail() async {
    
    final response = await productProvider.getProductDetail();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
