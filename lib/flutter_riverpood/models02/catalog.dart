import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/product.dart';

class Catalog extends StateNotifier<double> {
  late Map<Product, int> listProduct;

  Catalog() : super(0) {
    state = 0;
    listProduct = loadProduct();
  }

  void addProduct(Product product) {
    listProduct[product] = (listProduct[product] ?? 0) + 1;
    findTotalAmount();
  }

  void deleteProduct(Product product) {
    if (listProduct[product] != 0) {
      listProduct[product] = (listProduct[product] ?? 0) - 1;
      findTotalAmount();
    }
  }

  void findTotalAmount() {
    state = 0;
    listProduct.forEach((product, amount) {
      state = state + product.cost * amount;
    });
  }
}

