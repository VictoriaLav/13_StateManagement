import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product.dart';

class Catalog extends Bloc<Product, double> {

  late Map<Product, int> listProduct;

  Catalog() : super(0) {
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
    emit(0);
    listProduct.forEach((product, amount) {
      emit(state + product.cost * amount);
    });
  }

}

