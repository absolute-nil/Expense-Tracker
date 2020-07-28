import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('Rs. ${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        trailing: MediaQuery.of(context).size.width > 460?
        FlatButton.icon(
            label: Text("Delete"),
            icon: Icon(Icons.delete),
            textColor: Theme.of(context).errorColor,
            onPressed: () => deleteTransaction(transaction.id))
        :
         IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () =>
                deleteTransaction(transaction.id)),
      ),
    );
  }
}
