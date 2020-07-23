import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Laptop', amount: 100000.50, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Logitech Mouse', amount: 8000, date: DateTime.now())
  ];

  void _addTransaction(String title, double amount) {
    final newTx = Transaction(
        amount: amount,
        title: title,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        NewTransaction(this._addTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
