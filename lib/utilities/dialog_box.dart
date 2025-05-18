import 'package:flutter/material.dart';
import 'package:hive_learn/utilities/button.dart';

class DialogBox extends StatelessWidget {
  final dynamic controller;
  final VoidCallback onsave;
  const DialogBox({super.key, this.controller, required this.onsave});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Task',
              hintText: 'Add a new task',
            ),
          ),
          Row(
            children: [
              Appbutton(
                buttonText: 'Add Task',
                onPressed: () {
                  onsave();
                  Navigator.of(context).pop();
                },
              ),

              Appbutton(
                buttonText: 'Cancel',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
