// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc_exam/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc_exam/src/login_screen.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

final cartBloc = new CartBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var url = 'https://koreanjson.com/posts/1';
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        print('결과=================');
        print(response.body);
      }
    });

    return MaterialApp(
      title: 'Flutter Code Sample for material.Scaffold',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginScreen(),
    );
  }
}
