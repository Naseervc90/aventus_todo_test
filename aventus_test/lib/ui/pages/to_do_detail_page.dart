import 'package:aventus_test/models/todo.dart';
import 'package:aventus_test/utils/constants.dart';
import 'package:flutter/material.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          todo.title,
          style: TextStyle(
              color: todo.isCompleted ? Colors.green : Colors.red,
              fontSize: 24),
        )),
      ),
      body: SizedBox(
        height: 300,
        child: Card(
          margin:
              const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: todo.isCompleted ? Colors.green : Colors.red),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      const Text(AppConstants.todoDescription,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700)),
                      Text(' ${todo.description}',
                          style: const TextStyle(fontSize: 18.0)),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Column(
                  children: [
                    const Text('${AppConstants.todoDueDate} ',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700)),
                    Text('${todo.dueDate}',
                        style: const TextStyle(fontSize: 18.0)),
                  ],
                ),
                const SizedBox(height: 10.0),
                Column(
                  children: [
                    const Text(AppConstants.todoStatusCompletion,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700)),
                    Text(
                        todo.isCompleted
                            ? AppConstants.todoCompleted
                            : AppConstants.todoInComplete,
                        style: TextStyle(
                            color: todo.isCompleted ? Colors.green : Colors.red,
                            fontSize: 18.0)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
