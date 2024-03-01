import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final DateTime? dueDate;

  @HiveField(3)
  final bool isCompleted;

  final int key;
  const Todo({
    required this.title,
    this.description,
    this.dueDate,
    this.isCompleted = false,
    this.key = 0,
  });

  @override
  List<Object?> get props => [title, description, dueDate, isCompleted];

  Todo copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
