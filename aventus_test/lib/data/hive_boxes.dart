import 'package:aventus_test/models/todo.dart';
import 'package:aventus_test/utils/constants.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static late Box<Todo> todos;

  static Future openBoxes() async {
    todos = await Hive.openBox<Todo>(AppConstants.todoBoxName);
  }

  static void closeBoxes() {
    todos.close();
  }
}
