import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc_exam/src/catalog.dart';

class MyLoginScreen extends StatefulWidget {
  @override
  _MyLoginScreenState createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Column(
        children: <Widget>[
          Text('Login'),
          TextField(controller: _loginController,),
          Text('Password'),
          TextField(controller: _passwordController,),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCatalog()));
            },
            child: Text('Enter'),
          )
        ],
      ),
    );
  }
}