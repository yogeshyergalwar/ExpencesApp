import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/expensesmodel.dart';
import 'expences_List.dart';
import 'newExpaenselist.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Expences> _ListOfRegisterExpences = [
    Expences(
        tittle: 'Flutter Course',
        amount: 500.00,
        date: DateTime.now(),
        category: Category.Work),
    Expences(
        tittle: 'Foods',
        amount: 500.00,
        date: DateTime.now(),
        category: Category.Food),
    Expences(
        tittle: 'Travels',
        amount: 500.00,
        date: DateTime.now(),
        category: Category.Travel),
    Expences(
        tittle: 'others',
        amount: 500.00,
        date: DateTime.now(),
        category: Category.Others),
  ];

  void _bottomOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctxt) =>
          Container(height:double.infinity,child: Newexpaenselist(addExpesnse: _addExpense)),
    );
  }

  void _addExpense(Expences expence) {
    setState(() {
      _ListOfRegisterExpences.add(expence);
    });
  }
void _OnremoveExpence(Expences expence){
    setState(() {
      _ListOfRegisterExpences.remove(expence);
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expences App'),
        actions: [IconButton(onPressed: _bottomOverlay, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Text('chart '),
          Expanded(
            child: expenceList(
              expence: _ListOfRegisterExpences,OnRemoveExpense: _OnremoveExpence,
            ),
          )
        ],
      ),
    );
  }
}
