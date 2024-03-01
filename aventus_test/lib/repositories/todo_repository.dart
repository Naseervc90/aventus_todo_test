import 'package:hive/hive.dart';

import '../models/todo.dart';

class TodoRepository {
  final Box<Todo> todoBox;
  TodoRepository({required this.todoBox});

  Future<int> addTodo(Todo todo) async {
    return await todoBox.add(todo);
  }

  Todo getTodo(int index) {
    return todoBox.getAt(index)!;
  }

  List<Todo> getAllTodo() {
    return todoBox.values.toList();
  }

  Future<void> updateTodo(int index, Todo todo) async {
    await todoBox.putAt(index, todo);
  }

  Future<void> deleteTodo(int index) async {
    await todoBox.deleteAt(index);
  }
}
