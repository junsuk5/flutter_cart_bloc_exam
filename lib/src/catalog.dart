import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc_exam/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc_exam/src/item.dart';
import 'package:flutter_cart_bloc_exam/src/my_cart.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

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
        body: BlocProvider(
          bloc: _cartBloc,
          child: BlocBuilder<CartEvent, List<Item>>(
            bloc: _cartBloc,
            builder: (BuildContext context, List state) {
              return Center(
                child: ListView(
                  children: _itemList
                      .map((item) => _buildItem(item, state, _cartBloc))
                      .toList(),
                ),
              );
            },
          ),
        ));
  }

  Widget _buildItem(Item todo, List state, CartBloc bloc) {
    final isChecked = state.contains(todo);
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
              setState(() {
                if (isChecked) {
                  bloc.dispatch(CartEvent(CartEventType.remove, todo));
                } else {
                  bloc.dispatch(CartEvent(CartEventType.add, todo));
                }
              });
            }),
        title: Text(
          todo.title,
          style: TextStyle(fontSize: 31.0),
        ),
      ),
    );
  }
}
