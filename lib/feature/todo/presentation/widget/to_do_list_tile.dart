import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/core/extension/date_formate.dart';

import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do/to_do_bloc.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do_type/to_do_type_cubit.dart';

class ToDoListTile extends StatelessWidget {
  final ToDo toDo;
  const ToDoListTile({
    Key? key,
    required this.toDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoTypeCubit, ToDoTypeState>(
      builder: (context, state) {
        return ListTile(
          title: Text(toDo.title),
          subtitle: Text(toDo.dateTime.format),
          leading: Checkbox(
            value: toDo.isDone,
            onChanged: (value) {
              context.read<ToDoBloc>().add(
                    ToggleToDosEvent(
                      state.toDoType,
                      isDone: value ?? false,
                      toDo: toDo,
                    ),
                  );
              context.read<ToDoBloc>().add(
                    GetToDosEvent(state.toDoType),
                  );
            },
          ),
          trailing: IconButton(
            onPressed: () {
              context.read<ToDoBloc>().add(
                    DeleteToDosEvent(
                      state.toDoType,
                      toDo: toDo,
                    ),
                  );
              context.read<ToDoBloc>().add(
                    GetToDosEvent(state.toDoType),
                  );
            },
            icon: const Icon(Icons.minimize),
          ),
        );
      },
    );
  }
}
