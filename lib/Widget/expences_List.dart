import 'package:flutter/cupertino.dart';

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
            key: ValueKey(expence[index]),
            onDismissed: (direction) {
              OnRemoveExpense(expence[index]);
            },
            child: ExpenceItem(expence[index])));
  }
}
