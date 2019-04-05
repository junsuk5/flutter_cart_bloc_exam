import 'package:flutter_cart_bloc_exam/src/item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType { add, remove }

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc {
  final itemList = [
    Item("맥북", 20000000),
    Item("생존코딩", 32000),
    Item("컴퓨터", 10000000),
    Item("새우깡", 1500),
    Item("신라면", 2000),
  ];

  final _cartList = List<Item>();

  final _cartListSubject = BehaviorSubject<List<Item>>();

  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    if (event.type == CartEventType.add) {
      _cartList.add(event.item);
    } else {
      _cartList.remove(event.item);
    }
    _cartListSubject.add(_cartList);
  }
}
