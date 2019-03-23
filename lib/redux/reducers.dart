import '../model/cart_item.dart';
import 'actions.dart';

List<CartItem> cartItemsReducer(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is ToogleStateItemAction) {
    return toogleState(items, action);
  } else if (action is DeleteItemAcction) {
    return deleteItem(items, action);
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<CartItem> toogleState(List<CartItem> items, ToogleStateItemAction action) {
  List<CartItem> newItems =
      items.map((item) => item.name == action.item.name ? action.item : item);
  return newItems;
}

List<CartItem> deleteItem(List<CartItem> items, DeleteItemAcction action) {
  return List.from(items)..remove(action.item);
}
