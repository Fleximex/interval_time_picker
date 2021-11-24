import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light()),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  int _interval = 5;
  VisibleStep _visibleStep = VisibleStep.Fifths;

  void _selectTime() async {
    final TimeOfDay? newTime = await showIntervalTimePicker(
      context: context,
      initialTime: _time,
      interval: _interval,
      visibleStep: _visibleStep,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectTime,
              child: Text('SELECT TIME'),
            ),
            SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Slider(
                  value: _interval.toDouble(),
                  min: 1,
                  max: 30,
                  divisions: 30,
                  label: _interval.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _interval = value.toInt();
                    });
                  },
                ),
                DropdownButton<VisibleStep>(
                  value: _visibleStep,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (VisibleStep? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _visibleStep = newValue;
                      });
                    }
                  },
                  items: VisibleStep.values.map((VisibleStep visibleStep) {
                    return DropdownMenuItem<VisibleStep>(
                        value: visibleStep,
                        child: Text(visibleStep.toString()));
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
