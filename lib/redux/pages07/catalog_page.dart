import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models07/catalog.dart';
import '../../models/product.dart';

class CatalogPage extends StatelessWidget {
  CatalogPage({Key? key}) : super(key: key);

  final store = Store(reducer,
      initialState:
      AppState(totalAmount: 0, listProduct: loadProduct()));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog (redux)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.listProduct.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<Product> products = state.listProduct.keys.toList();
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
                                  state.listProduct[product].toString(),
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
                                      productFind = product;
                                      store.dispatch(AddAction());
                                      store.dispatch(AddProductAction());
                                      store.dispatch(TotalAction());
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.exposure_minus_1),
                                    onPressed: () {
                                      productFind = product;
                                      store.dispatch(DeleteAction());
                                      store.dispatch(DeleteProductAction());
                                      store.dispatch(TotalAction());
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
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => Container(
          width: 200,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: Text(
              'Total: ${state.totalAmount.toString()} \$',
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