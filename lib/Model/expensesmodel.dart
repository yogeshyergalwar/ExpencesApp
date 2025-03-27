import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final Formater = DateFormat.yMd();

enum Category { Food, Work, Travel, Others }

const CategoryIcons = {
  Category.Food: Icons.lunch_dining,
  Category.Work: Icons.work,
  Category.Travel: Icons.travel_explore,
  Category.Others: Icons.other_houses,
};

class Expences {
  final String id;
  final String tittle;
  final double amount;
  final DateTime date;
  final Category category;

  Expences(
      {required this.amount,
      required this.date,
      required this.tittle,
      required this.category})
      : id = uuid.v4();

  get FormattedDate {
    return Formater.format(date);
  }
}

class ExpenseBukey {
  final List<Expences> expenses;
  final Category category;
  ExpenseBukey.forCategory(List<Expences> allExpenses,this.category):expenses=allExpenses.where((ex)=>ex.category== category).toList();
  ExpenseBukey({required this.category, required this.expenses});

  double get totalExpenxe {
    double summ = 0;
    for (final expense in expenses) {
      summ += expense.amount;
    }
    return summ;
  }
}
