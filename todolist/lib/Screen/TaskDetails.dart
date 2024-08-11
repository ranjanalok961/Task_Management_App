import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todolist/data/Task.dart';
import 'package:todolist/data/todayProgress.dart';

class Taskdetails extends StatefulWidget {
  const Taskdetails(this.id, {super.key});
  final String id;

  @override
  State<Taskdetails> createState() => _TaskdetailsState();
}

class _TaskdetailsState extends State<Taskdetails> {
  Task? filteredTask;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    filteredTask = tasklist.firstWhere((task) => task.id == widget.id);
    updateProgress();
  }

  void updateProgress() {
    if (filteredTask != null && filteredTask!.tasks.isNotEmpty) {
      int checkedCount =
          filteredTask!.tasks.where((subtask) => subtask.checked).length;
      setState(() {
        progress = checkedCount / filteredTask!.tasks.length;
        todayprogress = todayTasks.isEmpty
            ? 0
            : todayTasks.fold<double>(0, (sum, task) {
                  int checkedCount =
                      task.tasks.where((subtask) => subtask.checked).length;
                  return sum + (checkedCount / task.tasks.length);
                }) /
                todayTasks.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Task Details",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(onPressed: (){Navigator.pop(context, todayprogress);}, icon: Icon(Icons.arrow_back))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                filteredTask!.projectName,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.date_range, color: Colors.white),
                  Text(
                    DateFormat('yyyy-MM-dd').format(filteredTask!.date),
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    filteredTask!.deadlineTime.format(context),
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Progress: ${(progress * 100).toStringAsFixed(0)}%",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white24,
                color: Colors.greenAccent,
                minHeight: 8,
              ),
              SizedBox(height: 20),
              Text(
                "Overview",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                filteredTask!.description,
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: ValueKey(filteredTask!.tasks[index]),
                      onDismissed: (direction) {
                        // Handle item dismissal
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                filteredTask!.tasks[index].subtask,
                                style: GoogleFonts.lato(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Switch(
                                value: filteredTask!.tasks[index].checked,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    filteredTask!.tasks[index].checked =
                                        newValue;
                                    updateProgress();
                                  });
                                },
                                activeColor: Colors.green,
                                inactiveThumbColor: Colors.red,
                                inactiveTrackColor: Colors.red[200],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                  itemCount: filteredTask!.tasks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
