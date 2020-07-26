import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;
  void _submitTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final _title = _titleController.text;
    final _amount = double.parse(_amountController.text);

    if (_title.isEmpty || _amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(_title, _amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _loadDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              onSubmitted: (_) => this._submitTransaction(),
            ),
            Row(
              children: <Widget>[
                Text("No Date Chosen Yet"),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    _selectedDate == null
                        ? "Choose Date"
                        : "Date: ${DateFormat.yMd().format(_selectedDate)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _loadDatePicker,
                )
              ],
            ),
            RaisedButton(
              onPressed: this._submitTransaction,
              color: Theme.of(context).primaryColor,
              child: Text("Add Transaction"),
              textColor: Theme.of(context).textTheme.button.color,
            ),
          ],
        ),
      ),
    );
  }
}
