import 'package:home_module_13/flutter_riverpood/models02/catalog.dart';

import 'product.dart';

class Catalog {
  late double totalAmount;
  late Map<Product, int> listProduct;

  Catalog() {
    totalAmount = 0;
    listProduct = loadProduct();
  }

  void addProduct(Product product) {
    listProduct[product] = (listProduct[product] ?? 0) + 1;
    totalAmount = totalAmount + product.cost;
  }

  void deleteProduct(Product product) {
    if (listProduct[product] != 0) {
      listProduct[product] = (listProduct[product] ?? 0) - 1;
      totalAmount = totalAmount - product.cost;
    }
  }
}
