import 'package:flutter/material.dart';
import 'package:todoapp_final_version/Constants/AppColors.dart';
import 'package:todoapp_final_version/Constants/MyButton.dart';
import 'package:todoapp_final_version/Constants/TodoTile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_final_version/Data/DataBase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TodoDataBase DB = TodoDataBase();
  var Box = Hive.box("MyBox");
  @override
  void initState() {
  // TODO: implement initState

  if (Box.get("Todos") == null) {

  DB.InitilTodo();

  } else {

  DB.GetTodo();

  }
  
  super.initState();
  }

  var TodoController = TextEditingController();
  void ShowDialog() {

  showDialog(context: context, builder: (BuildContext context) {

  return AlertDialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  backgroundColor: AppColors.SDBGColor,
  content: Container(
  width: 120,height: 160,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [

  TextField(
  controller: TodoController,
  decoration: InputDecoration(
  hintText: "Type Todo",
  hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.BorderColor),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: AppColors.BorderColor,),borderRadius: BorderRadius.circular(24)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: AppColors.BorderColor,),borderRadius: BorderRadius.circular(24))
  ),),
  SizedBox(height: 12,),
  Row(children: [

  MyButton(function: () => Navigator.pop(context), text: "Cancel", color: AppColors.Button2),SizedBox(width: 8,),
  MyButton(function: AddTodo, text: "Add Todo", color: AppColors.Button1)
  ],)
  ],),

  ),

  );

  });

  }

  void AddTodo() {
  if (TodoController.text.isNotEmpty) { 
  setState(() {
  DB.Todos.add([TodoController.text,false]);
  TodoController.clear();
  });
  Navigator.pop(context);}
  DB.UploadTodo();
  }

  void ChangeBool(value,index) {

  setState(() {
    
  DB.Todos[index][1] = !DB.Todos[index][1];
  DB.UploadTodo();

  });

  }
  void DeleteTodo(index) {

  setState(() {
  
  DB.Todos.removeAt(index);
  DB.UploadTodo();

  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(onPressed: ShowDialog,backgroundColor: Colors.black,child: Icon(Icons.add,size: 28 ,),),
    backgroundColor: AppColors.BGColor,
    body: Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(height: 60,),
    Text("Todo App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
    SizedBox(height: 40,),
    Expanded(child: ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,itemCount: DB.Todos.length,itemBuilder: (BuildContext context,index) {

    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TodoTile(TodoText: DB.Todos[index][0], IsDone: DB.Todos[index][1], onChange: (value) => ChangeBool(value,index), onDelete: (context) => DeleteTodo(index)),
    ],
    );

    }))
    ],)),

    );
  }
}