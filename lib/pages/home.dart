import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_learn/data/db.dart';
import 'package:hive_learn/utilities/dialog_box.dart';
import 'package:hive_learn/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDb db = ToDoDb();
  final myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  @override
  void initState() {
    if (myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop;
    });
    db.updateDataBase();
  }

  void createNewtask() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DialogBox(controller: _controller, onsave: saveNewTask);
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
        onPressed: createNewtask,
        backgroundColor: Colors.amber[700],

        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder:
            (context, index) => TodoTile(
              taskname: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              deleteFunction: (context) {
                setState(() {
                  db.todoList.removeAt(index);
                });
                db.updateDataBase();
              },
            ),
      ),
    );
  }
}
