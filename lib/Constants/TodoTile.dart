import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp_final_version/Constants/AppColors.dart';

class TodoTile extends StatelessWidget {

  final TodoText;
  final IsDone;
  Function(bool?)? onChange;
  Function(BuildContext)? onDelete;

  TodoTile({super.key, required this.TodoText,required this.IsDone,required this.onChange,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Slidable(endActionPane: ActionPane(motion: StretchMotion(),
    children: [SlidableAction(onPressed: onDelete,backgroundColor: Colors.red,borderRadius: BorderRadius.circular(24),icon: Icons.delete,)]) ,child: Container(
    width: 280,height: 90,
    decoration: BoxDecoration(color: AppColors.Button2,borderRadius: BorderRadius.circular(24)),
    child: Row(
    children: [
    SizedBox(width: 12,),
    Checkbox(value: IsDone, onChanged: onChange,activeColor: Colors.black,),
    SizedBox(width: 12,),
    Center(child: Text(TodoText,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: IsDone ? Colors.grey : Colors.black,decoration:  IsDone ? TextDecoration.lineThrough : null),)),
    ],
    ),
    ),),
    SizedBox(height: 24,)
    ],
    );
  }
}