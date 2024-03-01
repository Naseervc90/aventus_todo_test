import 'dart:developer';

import 'package:aventus_test/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/todo_repository.dart';
import '../../models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super(todoRepository.getAllTodo());

  void addTodo(Todo todo) async {
    try {
      await todoRepository.addTodo(todo);
      emit(todoRepository.getAllTodo());
    } catch (e) {
      log('${AppConstants.todoAddError} $e');
    }
  }

  void deleteTodo(int index) async {
    try {
      await todoRepository.deleteTodo(index);
      emit(todoRepository.getAllTodo());
    } catch (e) {
      log('${AppConstants.todoDeleteError} $e');
    }
  }

  void updateTodo(int index, Todo todo) async {
    try {
      await todoRepository.updateTodo(index, todo);
      emit(todoRepository.getAllTodo());
    } catch (e) {
      log('${AppConstants.todoUpdateError} $e');
    }
  }
}
