import 'package:flutter/material.dart';
import '../models/pattern.dart';
import '../simple_state_management/pages01/catalog_page.dart' as ssm;
import '../flutter_riverpood/pages02/catalog_page.dart' as fr;
import '../hooks_riverpood/pages03/catalog_page.dart' as hr;
import '../flutter_bloc_with_bloc/pages04/catalog_page.dart' as bb;
import '../flutter_bloc_with_cubit/pages05/catalog_page.dart' as bc;
import '../bloc/pages06/catalog_page.dart' as bloc;
import '../redux/pages07/catalog_page.dart' as redux;
import '../mobx/pages08/catalog_page.dart' as mobx;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patterns'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: listPattern.length,
                itemBuilder: (BuildContext context, int index) {
                  final pattern = listPattern[index];
                  return ListTile(
                    onTap: () {
                      var page;
                      switch(pattern.type) {
                        case PatternEnum.simpleStateManagement:
                          page = const ssm.CatalogPage();
                          break;
                        case PatternEnum.flutterRiverpod:
                          page = const fr.CatalogPage();
                          break;
                        case PatternEnum.hooksRiverpod:
                          page = const hr.CatalogPage();
                          break;
                        case PatternEnum.flutterBlocWithBloc:
                          page = const bb.CatalogPage();
                          break;
                        case PatternEnum.flutterBlocWithCubit:
                          page = const bc.CatalogPage();
                          break;
                        case PatternEnum.bloc:
                          page = const bloc.CatalogPage();
                          break;
                        case PatternEnum.redux:
                          page = redux.CatalogPage();
                          break;
                        case PatternEnum.mobx:
                          page = const mobx.CatalogPage();
                          break;
                        default:
                          page = const ssm.CatalogPage();
                          break;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => page),);
                    },
                    title: Text(
                      pattern.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}