import 'package:flutter/material.dart';

// ignore: camel_case_types
class timePage extends StatefulWidget {
  const timePage({Key? key}) : super(key: key);

  @override
  _timePageState createState() => _timePageState();
}

// ignore: camel_case_types
class _timePageState extends State<timePage> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _getTime(context);
              },
              child: const Text('Time Picker'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Time Value : ' + _selectedTime.format(context),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  _getTime(context) async {
    final _timePick = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        });

    if (_timePick != null) {
      setState(() {
        _selectedTime = _timePick;
      });
    }
  }
}
