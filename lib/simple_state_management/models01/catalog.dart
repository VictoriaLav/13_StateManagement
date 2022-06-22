import 'package:flutter/material.dart';
import '../../models/product.dart';

class Catalog with ChangeNotifier {
  late Map<Product, int> listProduct;

  Catalog() {
    listProduct = loadProduct();
  }

  void addProduct(Product product) {
    listProduct[product] = (listProduct[product] ?? 0) + 1;
    notifyListeners();
  }

  void deleteProduct(Product product) {
    if (listProduct[product] != 0) {
      listProduct[product] = (listProduct[product] ?? 0) - 1;
    }
    notifyListeners();
  }

  double findTotalAmount() {
    double totalAmount = 0;
    listProduct.forEach((product, amount) {
      totalAmount = totalAmount + product.cost * amount;
    });
    notifyListeners();
    return totalAmount;
  }
}

