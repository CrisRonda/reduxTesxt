import 'package:flutter/material.dart';
import 'shopping_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'model/cart_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) => ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) =>
                new ShoppingItem(item: list[index]),
          ),
    );
  }
}
