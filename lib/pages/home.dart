import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_learn/utilities/dialog_box.dart';
import 'package:hive_learn/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['Make a tutorial', false],
    ['Do homework', false],
    ['Do laundry', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewtask() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DialogBox(controller: _controller);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('To Do'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.amber[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder:
            (context, index) => TodoTile(
              taskname: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
            ),
      ),
    );
  }
}
