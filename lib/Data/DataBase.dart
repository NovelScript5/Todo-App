import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {

  List Todos = [];
  var Box = Hive.box("MyBox");

  void InitilTodo(){
  Todos = [
  ["Go Home",false],
  ["Eat Dinner",false]
  ];
  }

  void GetTodo() {

  Todos = Box.get("Todos");

  }

  void UploadTodo() {

  Box.put("Todos", Todos);

  }

}