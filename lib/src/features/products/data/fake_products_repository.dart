import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  FakeProductsRepository._();

  static FakeProductsRepository instance = FakeProductsRepository._();

  final List<Product> _products = kTestProducts;

  List<Product> getProducts() {
    return _products;
  }

  Product? getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProducts() async {
    // await Future.delayed(Duration(seconds: 1));
    return _products;
  }

  Stream<List<Product>> watchProducts() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProductById(String id) {
    return watchProducts()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

final productsRepositoryProvider =
    Provider<FakeProductsRepository>((_) => FakeProductsRepository.instance);
