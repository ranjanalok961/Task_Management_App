import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final List<String> time = ["All","Today","Due Task","Upcoming"];

enum TaskGroup { personal, work, shopping, health, study, finance, travel, fitness, household, miscellaneous }

const taskIcon = {
  TaskGroup.personal : Icons.personal_injury,
  TaskGroup.work : Icons.work,
  TaskGroup.shopping : Icons.shopping_bag,
  TaskGroup.health : Icons.health_and_safety,
  TaskGroup.study : Icons.cast_for_education,
  TaskGroup.finance :Icons.money,
  TaskGroup.travel : Icons.travel_explore

};
class SubTask {
  final String subtask;
  bool checked;

  SubTask(
    {
      required this.subtask,
      required this.checked
    }
  );
}

class Task {
  
  final String id;
  final TaskGroup taskGroup;
  final String projectName;
  final String description;
  final DateTime date;
  final TimeOfDay deadlineTime;
  final List<SubTask> tasks;

  
  Task({
    required this.taskGroup,
    required this.projectName,
    required this.description,
    required this.date,
    required this.deadlineTime,
    required this.tasks
  }): id = uuid.v4();

  
}


final List<Task> tasklist = [
  // Yesterday
  Task(
    taskGroup: TaskGroup.work,
    projectName: 'Website Redesign',
    description: 'Complete homepage design revisions',
    date: DateTime.now().subtract(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 17, minute: 0),
    tasks: [
      SubTask(subtask: 'Update header layout', checked: false),
      SubTask(subtask: 'Refine color scheme', checked: false),
      SubTask(subtask: 'Optimize images', checked: false),
      SubTask(subtask: 'Fix responsive issues', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.personal,
    projectName: 'Grocery Shopping',
    description: 'Prepare list for the week',
    date: DateTime.now().subtract(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 18, minute: 0),
    tasks: [
      SubTask(subtask: 'Add fresh vegetables', checked: false),
      SubTask(subtask: 'Include fruits', checked: false),
      SubTask(subtask: 'Buy dairy products', checked: false),
      SubTask(subtask: 'Stock up on snacks', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.shopping,
    projectName: 'Tech Gadgets',
    description: 'Research and shortlist new gadgets',
    date: DateTime.now().subtract(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 19, minute: 0),
    tasks: [
      SubTask(subtask: 'Compare laptop models', checked: false),
      SubTask(subtask: 'Check out latest smartphones', checked: false),
      SubTask(subtask: 'Read reviews', checked: false),
      SubTask(subtask: 'Prepare buying guide', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.study,
    projectName: 'Physics Homework',
    description: 'Complete assignments on electromagnetism',
    date: DateTime.now().subtract(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 20, minute: 0),
    tasks: [
      SubTask(subtask: 'Solve problems in textbook', checked: false),
      SubTask(subtask: 'Review lecture notes', checked: false),
      SubTask(subtask: 'Complete lab report', checked: false),
      SubTask(subtask: 'Prepare for upcoming test', checked: false),
    ],
  ),
  
  // Day 1
  Task(
    taskGroup: TaskGroup.work,
    projectName: 'App Development',
    description: 'Finish implementing new feature',
    date: DateTime.now(),
    deadlineTime: TimeOfDay(hour: 17, minute: 0),
    tasks: [
      SubTask(subtask: 'Code new feature', checked: false),
      SubTask(subtask: 'Write unit tests', checked: false),
      SubTask(subtask: 'Update documentation', checked: false),
      SubTask(subtask: 'Conduct peer review', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.personal,
    projectName: 'Fitness Goals',
    description: 'Update weekly workout plan',
    date: DateTime.now(),
    deadlineTime: TimeOfDay(hour: 18, minute: 0),
    tasks: [
      SubTask(subtask: 'Add new exercises', checked: false),
      SubTask(subtask: 'Adjust workout intensity', checked: false),
      SubTask(subtask: 'Plan recovery days', checked: false),
      SubTask(subtask: 'Track progress', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.shopping,
    projectName: 'Home Improvement',
    description: 'Select materials for renovation',
    date: DateTime.now(),
    deadlineTime: TimeOfDay(hour: 19, minute: 0),
    tasks: [
      SubTask(subtask: 'Choose paint colors', checked: false),
      SubTask(subtask: 'Pick flooring options', checked: false),
      SubTask(subtask: 'Compare prices', checked: false),
      SubTask(subtask: 'Order samples', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.study,
    projectName: 'History Research',
    description: 'Complete research paper draft',
    date: DateTime.now(),
    deadlineTime: TimeOfDay(hour: 20, minute: 0),
    tasks: [
      SubTask(subtask: 'Compile research notes', checked: false),
      SubTask(subtask: 'Write introduction', checked: false),
      SubTask(subtask: 'Draft main sections', checked: false),
      SubTask(subtask: 'Review references', checked: false),
    ],
  ),

  // Day 2
  Task(
    taskGroup: TaskGroup.work,
    projectName: 'Client Presentation',
    description: 'Prepare slides and notes',
    date: DateTime.now().add(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 17, minute: 0),
    tasks: [
      SubTask(subtask: 'Design presentation slides', checked: false),
      SubTask(subtask: 'Write speaker notes', checked: false),
      SubTask(subtask: 'Rehearse presentation', checked: false),
      SubTask(subtask: 'Prepare handouts', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.personal,
    projectName: 'Hiking Trip',
    description: 'Plan logistics and gear',
    date: DateTime.now().add(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 18, minute: 0),
    tasks: [
      SubTask(subtask: 'Check weather forecast', checked: false),
      SubTask(subtask: 'Pack essentials', checked: false),
      SubTask(subtask: 'Arrange transportation', checked: false),
      SubTask(subtask: 'Confirm accommodation', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.shopping,
    projectName: 'Winter Wardrobe',
    description: 'Shop for winter clothing',
    date: DateTime.now().add(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 19, minute: 0),
    tasks: [
      SubTask(subtask: 'Select winter jackets', checked: false),
      SubTask(subtask: 'Buy scarves and gloves', checked: false),
      SubTask(subtask: 'Find thermal wear', checked: false),
      SubTask(subtask: 'Check for sales', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.study,
    projectName: 'Chemistry Lab Report',
    description: 'Complete and submit report',
    date: DateTime.now().add(Duration(days: 1)),
    deadlineTime: TimeOfDay(hour: 20, minute: 0),
    tasks: [
      SubTask(subtask: 'Compile experiment data', checked: false),
      SubTask(subtask: 'Analyze results', checked: false),
      SubTask(subtask: 'Write conclusions', checked: false),
      SubTask(subtask: 'Submit report', checked: false),
    ],
  ),

  // Day 3
  Task(
    taskGroup: TaskGroup.work,
    projectName: 'Marketing Campaign',
    description: 'Develop social media strategy',
    date: DateTime.now().add(Duration(days: 2)),
    deadlineTime: TimeOfDay(hour: 17, minute: 0),
    tasks: [
      SubTask(subtask: 'Create content calendar', checked: false),
      SubTask(subtask: 'Design promotional graphics', checked: false),
      SubTask(subtask: 'Write ad copy', checked: false),
      SubTask(subtask: 'Schedule posts', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.personal,
    projectName: 'Cooking Class',
    description: 'Prepare for next lesson',
    date: DateTime.now().add(Duration(days: 2)),
    deadlineTime: TimeOfDay(hour: 18, minute: 0),
    tasks: [
      SubTask(subtask: 'Review recipes', checked: false),
      SubTask(subtask: 'Buy ingredients', checked: false),
      SubTask(subtask: 'Set up cooking space', checked: false),
      SubTask(subtask: 'Watch instructional videos', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.shopping,
    projectName: 'Office Supplies',
    description: 'Restock essential items',
    date: DateTime.now().add(Duration(days: 2)),
    deadlineTime: TimeOfDay(hour: 19, minute: 0),
    tasks: [
      SubTask(subtask: 'Order printer ink', checked: false),
      SubTask(subtask: 'Buy notebooks', checked: false),
      SubTask(subtask: 'Get desk organizers', checked: false),
      SubTask(subtask: 'Replace light bulbs', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.study,
    projectName: 'Biology Project',
    description: 'Prepare presentation for class',
    date: DateTime.now().add(Duration(days: 2)),
    deadlineTime: TimeOfDay(hour: 20, minute: 0),
    tasks: [
      SubTask(subtask: 'Gather research materials', checked: false),
      SubTask(subtask: 'Create slides', checked: false),
      SubTask(subtask: 'Practice presentation', checked: false),
      SubTask(subtask: 'Finalize handouts', checked: false),
    ],
  ),

  // Day 4
  Task(
    taskGroup: TaskGroup.work,
    projectName: 'Client Proposal',
    description: 'Draft and review proposal',
    date: DateTime.now().add(Duration(days: 3)),
    deadlineTime: TimeOfDay(hour: 17, minute: 0),
    tasks: [
      SubTask(subtask: 'Outline proposal sections', checked: false),
      SubTask(subtask: 'Draft content', checked: false),
      SubTask(subtask: 'Review with team', checked: false),
      SubTask(subtask: 'Submit final version', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.personal,
    projectName: 'Weekend Getaway',
    description: 'Plan itinerary and bookings',
    date: DateTime.now().add(Duration(days: 3)),
    deadlineTime: TimeOfDay(hour: 18, minute: 0),
    tasks: [
      SubTask(subtask: 'Choose destination', checked: false),
      SubTask(subtask: 'Book accommodations', checked: false),
      SubTask(subtask: 'Plan activities', checked: false),
      SubTask(subtask: 'Prepare travel documents', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.shopping,
    projectName: 'Pet Supplies',
    description: 'Restock pet essentials',
    date: DateTime.now().add(Duration(days: 3)),
    deadlineTime: TimeOfDay(hour: 19, minute: 0),
    tasks: [
      SubTask(subtask: 'Buy pet food', checked: false),
      SubTask(subtask: 'Get litter', checked: false),
      SubTask(subtask: 'Order toys', checked: false),
      SubTask(subtask: 'Check for discounts', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.study,
    projectName: 'Literature Review',
    description: 'Compile and summarize sources',
    date: DateTime.now().add(Duration(days: 3)),
    deadlineTime: TimeOfDay(hour: 20, minute: 0),
    tasks: [
      SubTask(subtask: 'Collect relevant articles', checked: false),
      SubTask(subtask: 'Summarize key points', checked: false),
      SubTask(subtask: 'Organize findings', checked: false),
      SubTask(subtask: 'Draft review', checked: false),
    ],
  ),

  // Day 5
  Task(
    taskGroup: TaskGroup.work,
    projectName: 'Product Launch',
    description: 'Finalize launch plan',
    date: DateTime.now().add(Duration(days: 4)),
    deadlineTime: TimeOfDay(hour: 17, minute: 0),
    tasks: [
      SubTask(subtask: 'Confirm launch date', checked: false),
      SubTask(subtask: 'Coordinate with marketing', checked: false),
      SubTask(subtask: 'Prepare press release', checked: false),
      SubTask(subtask: 'Set up launch event', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.personal,
    projectName: 'Book Club Meeting',
    description: 'Prepare discussion points',
    date: DateTime.now().add(Duration(days: 4)),
    deadlineTime: TimeOfDay(hour: 18, minute: 0),
    tasks: [
      SubTask(subtask: 'Review book notes', checked: false),
      SubTask(subtask: 'Prepare questions', checked: false),
      SubTask(subtask: 'Send meeting reminders', checked: false),
      SubTask(subtask: 'Arrange refreshments', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.shopping,
    projectName: 'Garden Supplies',
    description: 'Purchase items for gardening',
    date: DateTime.now().add(Duration(days: 4)),
    deadlineTime: TimeOfDay(hour: 19, minute: 0),
    tasks: [
      SubTask(subtask: 'Buy seeds and plants', checked: false),
      SubTask(subtask: 'Get gardening tools', checked: false),
      SubTask(subtask: 'Purchase soil and fertilizers', checked: false),
      SubTask(subtask: 'Check for discounts', checked: false),
    ],
  ),
  Task(
    taskGroup: TaskGroup.study,
    projectName: 'Programming Assignment',
    description: 'Complete coding project',
    date: DateTime.now().add(Duration(days: 4)),
    deadlineTime: TimeOfDay(hour: 20, minute: 0),
    tasks: [
      SubTask(subtask: 'Write code', checked: false),
      SubTask(subtask: 'Debug errors', checked: false),
      SubTask(subtask: 'Test functionality', checked: false),
      SubTask(subtask: 'Submit assignment', checked: false),
    ],
  ),
];

