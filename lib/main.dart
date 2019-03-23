import 'package:flutter/material.dart';
import 'shopping_car.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'model/cart_item.dart';
import 'redux/reducers.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  final store = DevToolsStore<List<CartItem>>(cartItemsReducer, initialState: List());
  runApp(ShoppingApp(store: store));
}

class ShoppingApp extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;
  ShoppingApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: ShoppingCart(store: store),
      ),
    );
  }
}
