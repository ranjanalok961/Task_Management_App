import 'package:todolist/data/Task.dart';

final now = DateTime.now();
List<Task> todayTasks = tasklist.where((task) =>
    task.date.year == now.year &&
    task.date.month == now.month &&
    task.date.day == now.day).toList();

int numberOfTodayTask = todayTasks.length;

double todayprogress = todayTasks.isEmpty
    ? 0
    : todayTasks.fold<double>(0, (sum, task) {
          int checkedCount =
              task.tasks.where((subtask) => subtask.checked).length;
          return sum + (checkedCount / task.tasks.length);
        }) /
        todayTasks.length;
