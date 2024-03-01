// main.dart
import 'package:aventus_test/blocs/cubit/todo_cubit.dart';
import 'package:aventus_test/models/todo.dart';
import 'package:aventus_test/ui/pages/to_do_list_page.dart';
import 'package:aventus_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aventus_test/repositories/todo_repository.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TodoAdapter());
  final todoBox = await Hive.openBox<Todo>('todo');
  final todoCubit = TodoCubit(TodoRepository(todoBox: todoBox));

  runApp(BlocProvider(
    create: (context) => todoCubit,
    child: MyApp(
      todoCubit: todoCubit,
    ),
  ));
}

// MyApp.dart
class MyApp extends StatelessWidget {
  final TodoCubit todoCubit;

  const MyApp({super.key, required this.todoCubit});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      home: BlocProvider(
        create: (context) => todoCubit,
        child: const TodoListPage(),
      ),
    );
  }
}
