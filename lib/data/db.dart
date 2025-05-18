import 'package:hive/hive.dart';

class ToDoDb{
  List todoList =[];

  final _myBox = Hive.box('mybox');


  void createInitialData(){
    todoList = [
      ['Make a tutorial', false],
      ['Do homework', false],
      ['Do laundry', false],
    ];
  }

  void loadData(){
    todoList = _myBox.get('TODOLIST');
  }

  void updateDataBase(){
    _myBox.put('TODOLIST', todoList);
  } 

}