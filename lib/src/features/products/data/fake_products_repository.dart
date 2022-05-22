import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductsRepository {

  FakeProductsRepository._();

  static FakeProductsRepository instance = FakeProductsRepository._();

  List<Product> getProducts() {
    return kTestProducts;
  }

  Product? getProductById(String id) {
    return kTestProducts.firstWhere((product) => product.id == id);
  }
}