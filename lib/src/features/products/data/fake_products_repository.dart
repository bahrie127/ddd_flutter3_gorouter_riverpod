import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProducts() {
    return _products;
  }

  Product? getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return _products;
  }

  Stream<List<Product>> watchProducts() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield _products;
  }

  Stream<Product?> watchProductById(String id) {
    return watchProducts()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

final productsRepositoryProvider =
    Provider<FakeProductsRepository>((_) => FakeProductsRepository());

final productsStreamProvider = StreamProvider<List<Product>>((ref) {
  final productRepository = ref.watch(productsRepositoryProvider);
  return productRepository.watchProducts();
});

final productsFutureProvider = FutureProvider<List<Product>>((ref) {
  final productRepository = ref.watch(productsRepositoryProvider);
  return productRepository.fetchProducts();
});

final productProvider = StreamProvider.family<Product?, String>((ref, id) {
  final productRepository = ref.watch(productsRepositoryProvider);
  return productRepository.watchProductById(id);
});
