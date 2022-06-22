import 'package:flutter/material.dart';
import '../models06/catalog.dart';
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
      home: MyCatalogPage(),
    );
  }
}

class MyCatalogPage extends StatefulWidget {
  MyCatalogPage({Key? key}) : super(key: key);

  @override
  State<MyCatalogPage> createState() => _MyCatalogPageState();
}

class _MyCatalogPageState extends State<MyCatalogPage> {
  late final CatalogBloc bloc = CatalogBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: bloc.state,
      builder: (_, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Catalog (bloc)'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.listProduct.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<Product> products = bloc.listProduct.keys.toList();
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
                                  bloc.listProduct[product].toString(),
                                  style:
                                  Theme.of(context).textTheme.headline6,
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
                                      bloc.action.add(CatalogEvent.add);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.exposure_minus_1),
                                    onPressed: () {
                                      productFind = product;
                                      bloc.action.add(CatalogEvent.delete);
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
              ],
            ),
          ),
          floatingActionButton: Container(
            width: 200,
            child: FloatingActionButton.extended(
              onPressed: () {
                productFind = bloc.listProduct.keys.toList()[5];
                bloc.action.add(CatalogEvent.add);
              },
              label: Text(
                'Total: ${(snapshot.data ?? 0).toString()} \$',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}