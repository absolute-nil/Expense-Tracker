import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text("Chart"),
              elevation: 5,
              color: Colors.blue,
            ),
            width: double.infinity,
          ),
          Card(
            child: Text("List of expenses"),
            color: Colors.red,
          )
        ],
      ),
    ),
    );
    
  }
}
