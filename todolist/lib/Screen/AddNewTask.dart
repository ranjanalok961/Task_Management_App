import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/data/Task.dart';

class Addnewtask extends StatefulWidget {
  const Addnewtask({super.key});

  @override
  State<Addnewtask> createState() => _AddnewtaskState();
}

class _AddnewtaskState extends State<Addnewtask> {
  var taskNameController = TextEditingController();
  var descriptionController = TextEditingController();
  TaskGroup? selectedCategory;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    taskNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  List<SubTask> sublist = [];
  void model() {
    final TextEditingController _subTaskame = TextEditingController();
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: false,
        context: context,
        builder: (ctx) {
          return Container(
            child: Column(
              children: [
                TextField(
                  controller: _subTaskame,
                  decoration: InputDecoration(
                    hintText: 'Enter your task name ..',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sublist.add(SubTask(
                                subtask: _subTaskame.text, checked: false));
                          });
                          _subTaskame.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Add")),
                    Expanded(child: Row()),
                    ElevatedButton(
                        onPressed: () {
                          _subTaskame.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"))
                  ],
                )
              ],
            ),
          );
        });
  }

  void AddItemInTaskList() {
    setState(() {
      tasklist.add(Task(
          taskGroup: selectedCategory!,
          projectName: taskNameController.text,
          description: descriptionController.text,
          date: _selectedDate!,
          deadlineTime: _selectedTime!,
          tasks: sublist));
    });
    Navigator.pop(context, tasklist);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Create New Task"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(
                hintText: 'Enter your task name ..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Category",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<TaskGroup>(
              hint: const Text('Select Category'),
              value: selectedCategory,
              items: TaskGroup.values.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item.name),
                );
              }).toList(),
              onChanged: (TaskGroup? value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : 'Selected Date: ${_selectedDate!.toLocal()}'
                        .split(' ')[0],
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(
                _selectedTime == null
                    ? 'Select Time'
                    : 'Selected Time: ${_selectedTime!.format(context)}',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter your description here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "SubTask",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    model();
                  },
                  child: Text(
                    "+ Add Subtask",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap:
                  true, // Allows ListView to take only the required height
              physics:
                  NeverScrollableScrollPhysics(), // Disables scrolling inside ListView
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(sublist[index]),
                  onDismissed: (direction) {
                    setState(() {
                      sublist.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5.0),
                        title: Text(
                          sublist[index].subtask,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10,
              ),
              itemCount: sublist.length,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AddItemInTaskList();
              },
              child: Text(
                "Create Task",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
