import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do/to_do_bloc.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do_type/to_do_type_cubit.dart';

class ToDoTypePicker extends StatelessWidget {
  const ToDoTypePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoTypeCubit, ToDoTypeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 10,
            children: ToDoType.values
                .map(
                  (e) => ChoiceChip(
                    label: Text(
                      e.name.toUpperCase(),
                    ),
                    selected: state.toDoType == e,
                    onSelected: (_) {
                      context.read<ToDoTypeCubit>().onTap(e);
                      context.read<ToDoBloc>().add(
                            GetToDosEvent(e),
                          );
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
