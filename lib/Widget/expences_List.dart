import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/expensesmodel.dart';
import 'expence_item.dart';

class expenceList extends StatelessWidget {
  const expenceList(
      {super.key, required this.expence, required this.OnRemoveExpense});

  final List<Expences> expence;
  final void Function(Expences expence) OnRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expence.length,
        itemBuilder: (ctext, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            key: ValueKey(expence[index]),
            onDismissed: (direction) {
              OnRemoveExpense(expence[index]);
            },
            child: ExpenceItem(expence[index])));
  }
}
