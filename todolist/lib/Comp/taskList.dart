import 'package:flutter/material.dart';
import 'package:todolist/Screen/TaskDetails.dart';
import 'package:todolist/data/Task.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Tasklist extends StatefulWidget {
  const Tasklist(this.tasklist,{super.key});
  final List<Task> tasklist;

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  void removeExpense(Task task) {
    final expenseIndex = widget.tasklist.indexOf(task);
    setState(() {
      widget.tasklist.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Task deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              widget.tasklist.insert(expenseIndex, task);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final task = widget.tasklist[index];
        final formattedDate = DateFormat('dd-MM-yyyy').format(task.date);
        final formattedDeadlineTime =
            '${task.deadlineTime.hour}:${task.deadlineTime.minute.toString().padLeft(2, '0')}';

        return Dismissible(
          key: ValueKey(task),
          onDismissed: (direction) {
            removeExpense(task);
          },
          background: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Taskdetails(task.id),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.purple.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Hero(
                      tag: 'taskIcon_${task.id}',
                      child: Icon(
                        taskIcon[task.taskGroup],
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.projectName,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Date: $formattedDate',
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Deadline: $formattedDeadlineTime',
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white70,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
      itemCount: widget.tasklist.length,
    );
  }
}
