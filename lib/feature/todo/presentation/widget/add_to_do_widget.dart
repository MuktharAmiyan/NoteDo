import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do/to_do_bloc.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do_type/to_do_type_cubit.dart';

class AddToDoWidget extends StatefulWidget {
  const AddToDoWidget({super.key});

  @override
  State<AddToDoWidget> createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  final _titleController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoTypeCubit, ToDoTypeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Enter To Do title',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_titleController.text.trim().isNotEmpty) {
                    context.read<ToDoBloc>().add(
                          AddToDoEvent(
                            state.toDoType,
                            title: _titleController.text,
                          ),
                        );
                    _titleController.clear();
                    context.read<ToDoBloc>().add(
                          GetToDosEvent(state.toDoType),
                        );
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
        );
      },
    );
  }
}
