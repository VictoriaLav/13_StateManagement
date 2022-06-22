import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models04/catalog.dart';
import '../../models/product.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CatalogBloc>(
        create: (_) => CatalogBloc(),
        child: MyCatalogPage(),
      ),
    );
  }
}

class MyCatalogPage extends StatelessWidget {
  MyCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog = context.read<CatalogBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog (flutter_bloc_with_bloc)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CatalogBloc, double>(
              builder: (_, state) => Expanded(
                child: ListView.builder(
                  itemCount: catalog.listProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<Product> products = catalog.listProduct.keys.toList();
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
                                  onPressed: () {
                                    context.read<CatalogBloc>().addProduct(product);
                                    context.read<CatalogBloc>().add(TotalAmountFind());
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.exposure_minus_1),
                                  onPressed: () {
                                    context.read<CatalogBloc>().deleteProduct(product);
                                    context.read<CatalogBloc>().add(TotalAmountFind());
                                  },
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
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 200,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: BlocBuilder<CatalogBloc, double>(
            builder: (_, state) => Text(
              'Total: ${state.toString()} \$',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
