import 'package:flutter/cupertino.dart';

import '../Model/expensesmodel.dart';
import 'expence_item.dart';

class expenceList extends StatelessWidget {
  const expenceList({super.key, required this.expence, });

  final List<Expences> expence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expence.length,
        itemBuilder: (ctext, index) => ExpenceItem(expence[index])
    );}
}
