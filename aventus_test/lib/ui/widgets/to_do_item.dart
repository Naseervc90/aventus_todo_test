import 'package:flutter/material.dart';

import '../../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final void Function(bool?)? onCheckboxChanged;
  final void Function()? onTap;

  TodoItem({
    required this.todo,
    this.onCheckboxChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          border: Border.all(
              color: todo.isCompleted ? Colors.greenAccent : Colors.redAccent)),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(color: todo.isCompleted ? Colors.green : Colors.red),
        ),
        subtitle: Text(todo.description!),
        trailing: Checkbox(
          fillColor: todo.isCompleted
              ? MaterialStateProperty.all(Colors.greenAccent)
              : MaterialStateProperty.all(Colors.white),
          side: BorderSide(
              color: todo.isCompleted ? Colors.greenAccent : Colors.redAccent),
          value: todo.isCompleted,
          onChanged: onCheckboxChanged,
        ),
        onTap: onTap,
      ),
    );
  }
}
