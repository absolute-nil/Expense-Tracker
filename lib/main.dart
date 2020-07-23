import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expense Manager"),
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  child: Text("Chart"),
                  elevation: 5,
                  color: Colors.blue,
                ),
                width: double.infinity,
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
