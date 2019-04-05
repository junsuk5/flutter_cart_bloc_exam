import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc_exam/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc_exam/main.dart';
import 'package:flutter_cart_bloc_exam/src/item.dart';
import 'package:flutter_cart_bloc_exam/src/my_cart.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalog'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.archive),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MyCart()));
              },
            )
          ],
        ),
        body: StreamBuilder<List<Item>>(
            stream: cartBloc.cartList,
            builder: (context, snapshot) {
              return Center(
                child: ListView(
                  children: cartBloc.itemList
                      .map((item) => _buildItem(item, snapshot.data))
                      .toList(),
                ),
              );
            }));
  }

  Widget _buildItem(Item todo, List<Item> state) {
    final isChecked = state == null ? false : state.contains(todo);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        subtitle: Text('${todo.price}'),
        trailing: IconButton(
            icon: isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.red,
                  )
                : Icon(Icons.check),
            onPressed: () {
              if (isChecked) {
                cartBloc.add(CartEvent(CartEventType.remove, todo));
              } else {
                cartBloc.add(CartEvent(CartEventType.add, todo));
              }
            }),
        title: Text(
          todo.title,
          style: TextStyle(fontSize: 31.0),
        ),
      ),
    );
  }
}
