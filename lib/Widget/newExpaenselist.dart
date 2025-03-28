import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:untitled2/Model/expensesmodel.dart';

class Newexpaenselist extends StatefulWidget {
  const Newexpaenselist({super.key,required this.addExpesnse});
final void Function(Expences expence) addExpesnse;
  @override
  State<Newexpaenselist> createState() => _NewexpaenselistState();
}

class _NewexpaenselistState extends State<Newexpaenselist> {
  /* var entertittle = '';

  void _savedate(String inputtittle) {
    entertittle = inputtittle;
  }
*/
  final _tittController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedDropdown = Category.Food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: now,
        initialDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenxedata() {
    final enteramout = double.tryParse(_amountController.text);
    final amoutinvalid = enteramout == null || enteramout <= 0;
    if (_tittController.text.trim().isEmpty | amoutinvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
                title: Text('Invalid Input'),
                content: Text('Please Fill Valid Data OR Missing Data'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Okey'))
                ],
              ));
      return;
    }

    widget.addExpesnse(Expences(amount: enteramout!, date: _selectedDate!, tittle: _tittController.text, category: _selectedDropdown));
Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tittController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(

        child: Padding(
          padding:  EdgeInsets.fromLTRB(16,48,16,keyboardSpace+16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _tittController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text('Enter The Expense Type*'),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        maxLength: 50,
                        decoration: InputDecoration(
                          prefix: Text('\₹'),
                          label: Text('Amount*'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? 'selected Date'
                            : Formater.format(_selectedDate!)),
                        IconButton(
                            onPressed: _presentDatePicker,
                            icon: Icon(Icons.date_range_rounded))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton(
                        value: _selectedDropdown,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDropdown = value!;
                          });
                        }),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    ElevatedButton(
                      onPressed: () {
                        print(_tittController);
                        _submitExpenxedata();
                       // Navigator.pop(context);
                      },
                      child: Text('save Expense'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
