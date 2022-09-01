import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interval Time Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: const ColorScheme.light()),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);
  int _interval = 5;
  VisibleStep _visibleStep = VisibleStep.fifths;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectTime,
              child: const Text('SELECT TIME'),
            ),
            const SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Slider(
                  value: _interval.toDouble(),
                  min: 1,
                  max: 60,
                  divisions: 60,
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
