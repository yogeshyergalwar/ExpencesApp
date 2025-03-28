import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/expensesmodel.dart';
import 'chart.dart';
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
        amount: 50.00,
        date: DateTime.now(),
        category: Category.Work),
    Expences(
        tittle: 'Foods',
        amount: 30.00,
        date: DateTime.now(),
        category: Category.Food),
    Expences(
        tittle: 'Travels',
        amount: 10.00,
        date: DateTime.now(),
        category: Category.Travel),
    Expences(
        tittle: 'others',
        amount: 5.00,
        date: DateTime.now(),
        category: Category.Others),
  ];

  void _bottomOverlay() {
    showModalBottomSheet(

      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctxt) => Container(
          height: double.infinity,
          child: Newexpaenselist(addExpesnse: _addExpense)),
    );
  }

  void _addExpense(Expences expence) {
    setState(() {
      _ListOfRegisterExpences.add(expence);
    });
  }

  void _OnremoveExpence(Expences expence) {
    final indexElemet = _ListOfRegisterExpences.indexOf(expence);
    setState(() {
      _ListOfRegisterExpences.remove(expence);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense Deleted'),
        action: SnackBarAction(
          onPressed: () {
            setState(() {
              _ListOfRegisterExpences.insert(indexElemet, expence);
            });
          },
          label: 'Undo',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heifht = MediaQuery.of(context).size.height;
    Widget maincontent = Center(
      child: Text('No expences Found,Start Adding Some'),
    );
    if (_ListOfRegisterExpences.isNotEmpty) {
      maincontent = expenceList(
        expence: _ListOfRegisterExpences,
        OnRemoveExpense: _OnremoveExpence,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Expences App'),
          actions: [
            IconButton(onPressed: _bottomOverlay, icon: Icon(Icons.add))
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(
                    expenses: _ListOfRegisterExpences,
                  ),
                  Expanded(
                    child: maincontent,
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(
                      expenses: _ListOfRegisterExpences,
                    ),
                  ),
                  Expanded(
                    child: maincontent,
                  )
                ],
              ));
  }
}
