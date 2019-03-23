import 'package:flutter/material.dart';
import 'model/cart_item.dart';
import 'model/cart_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/actions.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;
  ShoppingItem({this.item});
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemDeleted>(
      converter: (store) => (itemName) {
            store.dispatch(DeleteItemAcction(widget.item));
          },
      builder: (context, callback) => new Dismissible(
            onDismissed: (_) {
              setState(() {
                callback(widget.item.name);
              });
            },
            child: new StoreConnector<List<CartItem>, onToogleStateAction>(
              converter: (store) =>
                  (item) => store.dispatch(ToogleStateItemAction(item)),
              builder: (context, callback) => new ListTile(
                    title: new Text(widget.item.name),
                    leading: new Checkbox(
                        value: widget.item.checked,
                        onChanged: (value) {
                          setState(() {
                            widget.item.checked=value;
                          });
                        }),
                  ),
            ),
            key: new Key(widget.item.name),
          ),
    );
  }
}

typedef onToogleStateAction = Function(CartItem item);
typedef OnItemDeleted = Function(String itemname);
