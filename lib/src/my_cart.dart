import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc_exam/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc_exam/src/item.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('MyCart'),
        ),
        body: BlocProvider(
          bloc: _cartBloc,
          child: BlocBuilder<CartEvent, List<Item>>(
            bloc: _cartBloc,
            builder: (BuildContext context, List state) {
              var sum = 0;
              if (state.length > 0) {
                sum = state.map((item) => item.price).reduce((x, y) =>
                x + y);
              }
              return Center(
                child: Text('합계 : $sum'),
              );
            },
          ),
        ));
  }
}
