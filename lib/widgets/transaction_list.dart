import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                child: Text(
                  'Rs. ${transactions[index].amount.toStringAsFixed(2)}',
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
                      transactions[index].title,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat().add_yMMMd().format(transactions[index].date),
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            ],
          ),
        );
        },
        itemCount: transactions.length,
      )
        
    );
  }
}
