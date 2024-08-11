import 'package:flutter/material.dart';
import 'package:todolist/Comp/Filter.dart';
import 'package:todolist/Comp/TodayCard.dart';
import 'package:todolist/Comp/taskList.dart';
import 'package:todolist/Screen/AddNewTask.dart';
import 'package:todolist/data/Task.dart';
import 'package:todolist/data/todayProgress.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> _tasklist = tasklist;

  void Sort(String selectedOption) {
    setState(() {
      if (selectedOption == 'Time ↑') {
        _tasklist.sort((a, b) => a.date.compareTo(b.date));
      } else if (selectedOption == 'Time ↓') {
        _tasklist.sort((a, b) => b.date.compareTo(a.date));
      } else if (selectedOption == 'Name ↑') {
        _tasklist.sort((a, b) => a.projectName.compareTo(b.projectName));
      } else if (selectedOption == 'Name ↓') {
        _tasklist.sort((a, b) => b.projectName.compareTo(a.projectName));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 239),
        appBar: AppBar(
          title: Text("Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addnewtask()),
            );
            if (result != null && result is List<Task>) {
              setState(() {
                _tasklist = result;
              });
            }
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Todaycard(todayprogress),
              Filter(Sort),
              Expanded(child: Tasklist(_tasklist)),
            ],
          ),
        ),
      ),
    );
  }
}
