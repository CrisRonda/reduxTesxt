import '../model/cart_item.dart';

class AddItemAction {
  final CartItem item;
  AddItemAction(this.item);
}

class ToogleStateItemAction {
  final CartItem item;
  ToogleStateItemAction(this.item);
}

class DeleteItemAcction {
  final CartItem item;
  DeleteItemAcction(this.item);
}
