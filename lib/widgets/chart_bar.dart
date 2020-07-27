import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.amount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text('Rs.${amount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                      decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20),
                  )),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container( height: constraints.maxHeight * 0.15, child: Text(label)),
        ],
      );
    });
  }
}
