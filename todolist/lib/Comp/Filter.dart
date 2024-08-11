import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  Filter(this.sort, {super.key});
  void Function(String selectedOption) sort;
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> sortOptions = ['Time ↑', 'Time ↓', 'Name ↑', 'Name ↓'];
  String selectedOption='Time ↑';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "Filter",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: DropdownButton<String>(
              value: selectedOption,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.blue, fontSize: 18),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                  widget.sort(selectedOption);
                });
                
              },
              items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
