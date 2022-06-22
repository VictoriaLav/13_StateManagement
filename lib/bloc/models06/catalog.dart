import '../../models/product.dart';
import 'dart:async';

late Product productFind;

enum CatalogEvent { add, delete, total }

class CatalogBloc {
  double totalAmount = 0;
  late Map<Product, int> listProduct;

  final _stateController = StreamController<double>();
  final _eventsController = StreamController<CatalogEvent>();

  Stream<double> get state => _stateController.stream;
  Sink<CatalogEvent> get action => _eventsController.sink;

  CatalogBloc() {
    totalAmount = 0;
    listProduct = loadProduct();
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(CatalogEvent action) async {
    if (action == CatalogEvent.add) {
      listProduct[productFind] = (listProduct[productFind] ?? 0) + 1;
    }
    if (action == CatalogEvent.delete) {
      if (listProduct[productFind] != 0) {
        listProduct[productFind] = (listProduct[productFind] ?? 0) - 1;
      }
    }
    if (action == CatalogEvent.total) {
      totalAmount = 0;
      listProduct.forEach((product, amount) {
        totalAmount = totalAmount + product.cost * amount;
      });
    }

    totalAmount = 0;
    listProduct.forEach((product, amount) {
      totalAmount = totalAmount + product.cost * amount;
    });
    _stateController.add(totalAmount);
  }

  double total() {
    return totalAmount;
  }
}
