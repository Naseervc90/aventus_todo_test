import 'package:aventus_test/blocs/cubit/todo_cubit.dart';
import 'package:aventus_test/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aventus_test/models/todo.dart';
import 'package:flutter/material.dart';

class TodoFormScreen extends StatefulWidget {
  final Todo? todo;

  const TodoFormScreen({super.key, this.todo});

  @override
  _TodoFormScreenState createState() => _TodoFormScreenState();
}

class _TodoFormScreenState extends State<TodoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime _dueDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.todo?.description ?? '');
    _dueDate = widget.todo?.dueDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.todo == null ? 'New todo' : 'Edit todo',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      labelText: 'Title',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppConstants.todoWithoutTitle;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      labelText: AppConstants.todoDescription),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _dueDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != _dueDate) {
                          setState(() {
                            _dueDate = picked;
                          });
                        }
                      },
                      child: const Text(AppConstants.todoDueDate),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Todo newTodo = Todo(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            dueDate: _dueDate,
                            isCompleted: false,
                          );

                          context.read<TodoCubit>().addTodo(newTodo);

                          Navigator.pop(context);
                        }
                      },
                      child: const Text(AppConstants.save),
                    ),
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
