import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String? taskname;
  final bool? taskCompleted;
  final Function(bool?)? onChanged;

  const TodoTile({
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.amber[700],
            ),
            Text(taskname!, style: TextStyle(
              decoration: taskCompleted! ? TextDecoration.lineThrough : null,
              color: taskCompleted! ? Colors.grey : Colors.black,
            ),),
          ],
        ),
      ),
    );
  }
}
