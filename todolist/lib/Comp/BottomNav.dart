import 'package:flutter/material.dart';
import 'package:todolist/Screen/Home.dart';
import 'package:todolist/Screen/Tasks.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _selectedIndex = 0;

  void _setPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenPage;
    switch (_selectedIndex) {
      case 1:
        screenPage = Tasks();
        break;
      default:
        screenPage = Home();
    }

    return Scaffold(
      body: screenPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _setPage,
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 25),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Color.fromARGB(255, 140, 141, 141),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: '',
            backgroundColor: Color.fromARGB(255, 140, 141, 141),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
