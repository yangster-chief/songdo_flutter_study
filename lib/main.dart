import 'package:flutter/material.dart';
import 'package:flutter_study/page/counter_page.dart';

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

  final List<Widget> _widgetOptions = <Widget>[
    const Center(
      child: Text(
        'Index 0',
      ),
    ),
    const Center(
      child: Text(
        'Index 1',
      ),
    ),
    const Center(
      child: Text(
        'Index 2',
      ),
    ),
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
          title: const Text('widget.title'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.lightBlue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Counter'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined), label: 'BMI Cal'),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_rounded), label: 'To-do list'),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined), label: 'Stopwatch'),
          ],
        ),
        body: _widgetOptions[_selectedIndex],
      ),
    );
  }
}
