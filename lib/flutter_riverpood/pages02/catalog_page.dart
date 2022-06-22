import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models02/catalog.dart';
import '../../models/product.dart';

final catalogProvider = StateNotifierProvider<Catalog, double>((_) => Catalog());

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyCatalogPage(),
      ),
    );
  }
}

class MyCatalogPage extends ConsumerWidget {
  MyCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmount = ref.watch(catalogProvider);
    final provider = ref.watch(catalogProvider.notifier);

    print('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog (flutter_riverpood)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: provider.listProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  List<Product> products = provider.listProduct.keys.toList();
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
                              provider.listProduct[product].toString(),
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
                                onPressed: () => provider.addProduct(product),
                              ),
                              IconButton(
                                icon: Icon(Icons.exposure_minus_1),
                                onPressed: () => provider.deleteProduct(product),
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
            'Total: ${totalAmount.toString()} \$',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}