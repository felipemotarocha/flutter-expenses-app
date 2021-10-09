import 'package:expenses_app/entities/transaction.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));

        var weekDayTotalAmount = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          final currentTransaction = recentTransactions[i];

          final transactionBelongsToCurrentWeekDay =
              currentTransaction.date.day == weekDay.day &&
                  currentTransaction.date.month == weekDay.month &&
                  currentTransaction.date.year == weekDay.year;

          if (transactionBelongsToCurrentWeekDay) {
            weekDayTotalAmount += currentTransaction.amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': weekDayTotalAmount
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map(
          (data) {
            return Text('${data['day']}: ${data['amount']}');
          },
        ).toList(),
      ),
    );
  }
}
