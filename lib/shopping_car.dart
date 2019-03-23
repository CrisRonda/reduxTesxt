import 'package:flutter/material.dart';
import 'shopping_list.dart';
import 'add_item_dialog.dart';
import 'model/cart_item.dart';
import 'redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class ShoppingCart extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;
  ShoppingCart({this.store});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Shopping cart'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
      endDrawer: new ReduxDevTools(store),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
