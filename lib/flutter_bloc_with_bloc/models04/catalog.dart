import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product.dart';

abstract class TotalAmountEvent {}
class TotalAmountFind extends TotalAmountEvent {}

class Catalog extends Bloc<TotalAmountEvent, double> {

  late Map<Product, int> listProduct;

  Catalog() : super(0) {
    on<TotalAmountFind>((event, emit) {
      emit(0);
      listProduct.forEach((product, amount) {
        emit(state + product.cost * amount);
      });
    });
    listProduct = loadProduct();
  }

  void addProduct(Product product) {
    listProduct[product] = (listProduct[product] ?? 0) + 1;
  }

  void deleteProduct(Product product) {
    if (listProduct[product] != 0) {
      listProduct[product] = (listProduct[product] ?? 0) - 1;
    }
  }

  // void findTotalAmount() {
  //   emit(0);
  //   listProduct.forEach((product, amount) {
  //     emit(state + product.cost * amount);
  //   });
  // }

}

