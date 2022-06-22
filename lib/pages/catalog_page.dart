import 'package:flutter/material.dart';
import 'package:home_module_13/models/product.dart';
import '../models/catalog.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  Catalog catalog = Catalog();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = catalog.listProduct.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(product.assetName),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Expanded(
                          child: Align(
                          alignment: Alignment.center,
                            child: Text(
                              catalog.listProduct[product].toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.exposure_plus_1),
                                onPressed: () => setState(() {
                                  catalog.addProduct(product);
                                }),
                              ),
                              IconButton(
                                icon: Icon(Icons.exposure_minus_1),
                                onPressed: () => setState(() {
                                  catalog.deleteProduct(product);
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '${product.cost.toString()} \$',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 200,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'Total: ${catalog.totalAmount.toString()} \$',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}