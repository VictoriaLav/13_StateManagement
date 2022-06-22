class Product {
  final int id;
  final String name;
  final double cost;

  const Product({required this.id, required this.name, required this.cost});

  String get assetName => 'assets/images/$id.png';
}

Map<Product, int> loadProduct() {
  return <Product, int>
  {
    Product(
        id: 0,
        name: 'Hot dog',
        cost: 2
    ): 0,
    Product(
        id: 1,
        name: 'French fries',
        cost: 1
    ): 0,
    Product(
        id: 2,
        name: 'Pizza',
        cost: 8
    ): 0,
    Product(
        id: 3,
        name: 'Burger',
        cost: 4
    ): 0,
    Product(
        id: 4,
        name: 'Ice cream',
        cost: 0.5
    ): 0,
    Product(
        id: 5,
        name: 'Cake',
        cost: 0.5
    ): 0,
    Product(
        id: 6,
        name: 'Coffee',
        cost: 5
    ): 0,
  };
}