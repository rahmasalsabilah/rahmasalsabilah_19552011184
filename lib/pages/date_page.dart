import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class datePage extends StatefulWidget {
  const datePage({Key? key}) : super(key: key);

  @override
  _datePageState createState() => _datePageState();
}

// ignore: camel_case_types
class _datePageState extends State<datePage> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _getDate(context);
            },
            child: const Text('Date Picker'),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Date Value : ' + _dateFormat.format(_selectedDate),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      )),
    );
  }

  _getDate(context) async {
    final _datePick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(
        const Duration(days: 30),
      ),
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (_datePick != null) {
      setState(() {
        _selectedDate = _datePick;
      });
    }
  }
}
