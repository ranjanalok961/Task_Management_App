import 'package:flutter/material.dart';
import 'package:todolist/Comp/StartScreen.dart';
import 'package:todolist/data/Task.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  // final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _scheduleTaskNotifications();
  }

  void _scheduleTaskNotifications() {
    for (var task in tasklist) {
      final deadlineDateTime = DateTime(
        task.date.year,
        task.date.month,
        task.date.day,
        task.deadlineTime.hour,
        task.deadlineTime.minute,
      );

      
      // _notificationService.scheduleNotification(
      //   deadlineDateTime,
      //   'Task Deadline: ${task.projectName}',
      //   task.description,
      // );
    }
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent, // Background color
        body: StartScreen()
      ),
    );
  }
}