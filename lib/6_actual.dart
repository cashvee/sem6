import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: StudentScreen()));

class StudentScreen extends StatelessWidget {
  final students = [
    {"name": "Arjun Sharma", "department": "CSE"},
    {"name": "Priya Singh", "department": "IT"},
    {"name": "Rahul Kumar", "department": "ECE"},
    {"name": "Neha Gupta", "department": "MECH"},
    {"name": "Vikram Reddy", "department": "CSE"},
    {"name": "Anjali Das", "department": "IT"},
    {"name": "Siddharth Jain", "department": "ECE"},
    {"name": "Ritu Sharma", "department": "MECH"},
    {"name": "Kartik Varma", "department": "CSE"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final s = students[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(s["name"]!),
              subtitle: Text(s["department"]!),
            ),
          );
        },
      ),
    );
  }
}