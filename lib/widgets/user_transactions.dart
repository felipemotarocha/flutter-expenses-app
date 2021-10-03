import 'package:flutter/material.dart';

import 'package:expenses_app/entities/transaction.dart';

import 'package:expenses_app/widgets/transaction_list.dart';

class UserTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const UserTransactions({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: transactions),
      ],
    );
  }
}
