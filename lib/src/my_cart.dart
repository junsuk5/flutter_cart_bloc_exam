import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc_exam/main.dart';
import 'package:flutter_cart_bloc_exam/src/item.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyCart'),
        ),
        body: StreamBuilder<List<Item>>(
            stream: cartBloc.cartList,
            builder: (context, snapshot) {
              var sum = 0;
              if (snapshot.data.length > 0) {
                sum = snapshot.data
                    .map((item) => item.price)
                    .reduce((x, y) => x + y);
              }
              return Center(
                child: Text('합계 : $sum'),
              );
            }));
  }
}
