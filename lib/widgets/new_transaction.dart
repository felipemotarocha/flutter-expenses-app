import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function handleAddTransactionPress;

  NewTransaction({Key? key, required this.handleAddTransactionPress})
      : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onPressed: () => handleAddTransactionPress(
                titleController.text,
                double.parse(amountController.text),
              ),
              child: const Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
