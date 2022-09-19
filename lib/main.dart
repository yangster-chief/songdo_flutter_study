import 'package:flutter/material.dart';
import 'package:flutter_study/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Counter App',
    'BMI Calculator App',
    'TODO List App',
    'Stopwatch App',
  ];

  final List<Widget> _widgetOptions = <Widget>[
    const CounterPage(),
    const BMICalculatorPage(),
    const TODOListPage(),
    const Center(
      child: Text(
        'Index 3',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.lightBlue,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Counter'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined), label: 'BMI Cal'),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_rounded), label: 'TODO list'),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined), label: 'Stopwatch'),
          ],
        ),
        body: _widgetOptions[_selectedIndex],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
