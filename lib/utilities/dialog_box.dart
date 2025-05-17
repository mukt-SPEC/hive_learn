import 'package:flutter/material.dart';

class  DialogBox extends StatelessWidget {
  final dynamic controller;
  const DialogBox({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Task',
              hintText: 'Add a new task',
            ),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Add Task')),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
    
  }
}
