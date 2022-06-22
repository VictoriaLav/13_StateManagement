import '../../models/product.dart';
import 'package:mobx/mobx.dart';

part 'catalog.g.dart';

//flutter pub run build_runner build
class Catalog = _Catalog with _$Catalog;

abstract class _Catalog with Store {

  @observable
  Map<Product, int> listProduct = loadProduct();

  @observable
  double totalAmount = 0;

  @action
  void addProduct(Product product) {
    listProduct[product] = (listProduct[product] ?? 0) + 1;
    findTotalAmount();
  }

  @action
  void deleteProduct(Product product) {
    if (listProduct[product] != 0) {
      listProduct[product] = (listProduct[product] ?? 0) - 1;
      findTotalAmount();
    }
  }

  @action
  void findTotalAmount() {
    totalAmount = 0;
    listProduct.forEach((product, amount) {
      totalAmount = totalAmount + product.cost * amount;
    });
  }

  @action
  double getTotalAmount() {
    return totalAmount;
  }

}

