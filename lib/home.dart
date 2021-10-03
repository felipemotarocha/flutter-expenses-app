// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:expenses_app/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: const Text('Add Transaction'),
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
