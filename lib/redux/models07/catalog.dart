import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:redux/redux.dart';

double _totalAmount = 0;
late Product productFind;

class AddAction {}

class DeleteAction {}

class AddProductAction {}

class DeleteProductAction {}

class TotalAction {}

@immutable
class AppState {
  final double totalAmount;
  final Map<Product, int> listProduct;

  AppState({required this.totalAmount, required this.listProduct});

  AppState copyWith({
    double? totalAmount,
    Map<Product, int>? listProduct
  }) {
    return AppState(
      totalAmount: totalAmount ?? this.totalAmount,
      listProduct: listProduct ?? this.listProduct,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState && runtimeType == other.runtimeType &&
              totalAmount == other.totalAmount &&
              listProduct == other.listProduct;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return 'AppState{totalAmount: $totalAmount}';
  }

}

AppState reducer(AppState state, dynamic action) => AppState(
    totalAmount: _totalAmountReducer(state.totalAmount, action),
    listProduct: _listProductReducer(state.listProduct, action)
);

Reducer<double> _totalAmountReducer = combineReducers([
  TypedReducer<double, AddAction>(_add),
  TypedReducer<double, DeleteAction>(_delete),
  TypedReducer<double, TotalAction>(_total),
]);

double _add(double totalAmount, AddAction action) => totalAmount;

double _delete(double totalAmount, DeleteAction action) => totalAmount;

double _total(double totalAmount, TotalAction action) => _totalAmount;

Reducer<Map<Product, int>> _listProductReducer = combineReducers([
  TypedReducer<Map<Product, int>, AddProductAction>(_addProduct),
  TypedReducer<Map<Product, int>, DeleteProductAction>(_deleteProduct)
]);

Map<Product, int> _addProduct(Map<Product, int> listProduct, AddProductAction action) {
  listProduct[productFind] = (listProduct[productFind] ?? 0) + 1;
  _totalAmount = _totalAmount + productFind.cost;
  return listProduct;
}

Map<Product, int> _deleteProduct(Map<Product, int> listProduct, DeleteProductAction action) {
  if (listProduct[productFind] != 0) {
    listProduct[productFind] = (listProduct[productFind] ?? 0) - 1;
    _totalAmount = _totalAmount - productFind.cost;
  }
  return listProduct;
}