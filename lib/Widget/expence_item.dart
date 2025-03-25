import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Model/expensesmodel.dart';

class ExpenceItem extends StatelessWidget {
  ExpenceItem(
    this.expence, {
    super.key,
  });

  final Expences expence;

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
        child: Column(
          children: [
            Text(expence.tittle),

            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(expence.amount.toStringAsFixed(2)),
               Spacer(),
               Row(
                 children: [
                   Icon(CategoryIcons[expence.category]),
                   SizedBox(width: 2,),
                   Text(expence.FormattedDate),
                 ],
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}
