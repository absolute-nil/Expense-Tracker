import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: userTransactions.map((tx) {
      return Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              child: Text(
                'Rs. ${tx.amount}',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat().add_yMMMd().format(tx.date),
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        ),
      );
    }).toList());
  }
}
