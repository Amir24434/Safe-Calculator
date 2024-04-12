import 'package:calculator/screens/calculator_screen.dart';
import 'package:calculator/screens/todo_scrreen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<Dashboard> {
  int _currentIndex = 0;
  final pages = [
    const CalculatorScreen(),
    ToDoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[600],
        elevation: 0,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey[200],
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.calculate_rounded,
            ),
            backgroundColor: Colors.blue[900],
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.note_alt_rounded,
            ),
            backgroundColor: Colors.blue[900],
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}
