import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/actions.dart';
import 'model/cart_item.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String itemname;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, onItemAddedCalback>(
      converter: (store) => (itemname) => store
          .dispatch(AddItemAction(CartItem(name: itemname, checked: false))),
      builder: (context, callback) => AlertDialog(
            title: Text("Add Item"),
            contentPadding: EdgeInsets.all(16),
            content: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Item Name",
                    hintText: "Eg. iPhone",
                  ),
                  onChanged: (value) {
                    setState(() {
                      itemname = value;
                    });
                  },
                ))
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              FlatButton(
                onPressed: () {
                  callback(itemname);
                  Navigator.of(context).pop();
                },
                child: Text("Add"),
              )
            ],
          ),
    );
  }
}

typedef onItemAddedCalback = Function(String itemname);
