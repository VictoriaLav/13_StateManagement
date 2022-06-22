import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models01/catalog.dart';
import '../../models/product.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (_) => Catalog(),
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

class MyCatalogPage extends StatefulWidget {
  const MyCatalogPage({Key? key}) : super(key: key);

  @override
  State<MyCatalogPage> createState() => _MyCatalogPageState();
}

class _MyCatalogPageState extends State<MyCatalogPage> {
  @override
  void initState() {
    print('simple_state_management');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog (simple_state_management)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Catalog>(
              builder: (context, state, child) => Expanded(
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
                                  onPressed: () => setState(() {
                                    state.addProduct(product);
                                  }),
                                ),
                                IconButton(
                                  icon: Icon(Icons.exposure_minus_1),
                                  onPressed: () => setState(() {
                                    state.deleteProduct(product);
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
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 200,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'Total: ${context.read<Catalog>().findTotalAmount().toString()} \$',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}