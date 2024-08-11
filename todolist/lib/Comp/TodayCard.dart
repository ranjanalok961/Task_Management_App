import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/data/todayProgress.dart';

class Todaycard extends StatefulWidget {
  Todaycard(this.todayprogress, {super.key});
  double todayprogress;
  @override
  State<Todaycard> createState() => _TodaycardState();
}

class _TodaycardState extends State<Todaycard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.task_alt,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Today's Tasks",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tasks: $numberOfTodayTask",
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Progress",
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        color: Colors.yellowAccent,
                        value: widget.todayprogress,
                        minHeight: 8,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '${(widget.todayprogress * 100).toStringAsFixed(0)}%',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
