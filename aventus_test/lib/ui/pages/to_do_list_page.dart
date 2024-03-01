import 'package:aventus_test/models/todo.dart';
import 'package:aventus_test/ui/pages/to_do_detail_page.dart';
import 'package:aventus_test/ui/pages/todo_form_fields.dart';
import 'package:aventus_test/ui/widgets/to_do_item.dart';
import 'package:aventus_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cubit/todo_cubit.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(AppConstants.todoListScreenTitle)),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoItem(
                todo: todo,
                onCheckboxChanged: (value) {
                  context.read<TodoCubit>().updateTodo(
                        index,
                        todo.copyWith(isCompleted: value ?? false),
                      );
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoDetailScreen(todo: todo),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: BlocProvider.of<TodoCubit>(context),
                  child: const TodoFormScreen(),
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
