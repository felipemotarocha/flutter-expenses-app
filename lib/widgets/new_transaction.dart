import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function handleAddTransactionPress;

  NewTransaction({Key? key, required this.handleAddTransactionPress})
      : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _handleAddTransactionPress() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    handleAddTransactionPress(enteredTitle, enteredAmount);
  }

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
              onSubmitted: (_) => _handleAddTransactionPress(),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _handleAddTransactionPress(),
            ),
            FlatButton(
              onPressed: _handleAddTransactionPress,
              child: const Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
