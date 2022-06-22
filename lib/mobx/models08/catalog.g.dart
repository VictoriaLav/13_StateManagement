// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Catalog on _Catalog, Store {
  late final _$listProductAtom =
      Atom(name: '_Catalog.listProduct', context: context);

  @override
  Map<Product, int> get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(Map<Product, int> value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  late final _$totalAmountAtom =
      Atom(name: '_Catalog.totalAmount', context: context);

  @override
  double get totalAmount {
    _$totalAmountAtom.reportRead();
    return super.totalAmount;
  }

  @override
  set totalAmount(double value) {
    _$totalAmountAtom.reportWrite(value, super.totalAmount, () {
      super.totalAmount = value;
    });
  }

  late final _$_CatalogActionController =
      ActionController(name: '_Catalog', context: context);

  @override
  void addProduct(Product product) {
    final _$actionInfo =
        _$_CatalogActionController.startAction(name: '_Catalog.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_CatalogActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteProduct(Product product) {
    final _$actionInfo =
        _$_CatalogActionController.startAction(name: '_Catalog.deleteProduct');
    try {
      return super.deleteProduct(product);
    } finally {
      _$_CatalogActionController.endAction(_$actionInfo);
    }
  }

  @override
  void findTotalAmount() {
    final _$actionInfo = _$_CatalogActionController.startAction(
        name: '_Catalog.findTotalAmount');
    try {
      return super.findTotalAmount();
    } finally {
      _$_CatalogActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getTotalAmount() {
    final _$actionInfo =
        _$_CatalogActionController.startAction(name: '_Catalog.getTotalAmount');
    try {
      return super.getTotalAmount();
    } finally {
      _$_CatalogActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProduct: ${listProduct},
totalAmount: ${totalAmount}
    ''';
  }
}
