import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/Comp/Filter.dart';
import 'package:todolist/Comp/taskList.dart';
import 'package:todolist/data/Task.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  String selectedFilter = "All";

  List<Task> get filteredTasks {
    final now = DateTime.now();

    if (selectedFilter == "All") {
      return tasklist;
    } else if (selectedFilter == "Today") {
      return tasklist
          .where((task) =>
              task.date.isAtSameMomentAs(now) ||
              (task.date.year == now.year &&
                  task.date.month == now.month &&
                  task.date.day == now.day))
          .toList();
    } else if (selectedFilter == "Due Task") {
      return tasklist.where((task) => task.date.isBefore(now)).toList();
    } else if (selectedFilter == "Upcoming") {
      return tasklist.where((task) => task.date.isAfter(now)).toList();
    }
    return [];
  }


  void Sort(String selectedOption) {
    setState(() {
      if (selectedOption == 'Time ↑') {
        filteredTasks.sort((a, b) => a.date.compareTo(b.date));
      } else if (selectedOption == 'Time ↓') {
        filteredTasks.sort((a, b) => b.date.compareTo(a.date));
      } else if (selectedOption == 'Name ↑') {
        filteredTasks.sort((a, b) => a.projectName.compareTo(b.projectName));
      } else if (selectedOption == 'Name ↓') {
        filteredTasks.sort((a, b) => b.projectName.compareTo(a.projectName));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final isSelected = selectedFilter == time[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = time[index];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.purple
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          time[index],
                          style: GoogleFonts.lato(
                            color: isSelected
                                ? Colors.white
                                : Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10),
                  itemCount: time.length,
                ),
              ),
              SizedBox(height: 10),
              Filter(Sort),
              Expanded(
                child: Tasklist(filteredTasks),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
