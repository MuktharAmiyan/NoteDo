import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do/to_do_bloc.dart';
import 'package:notedo/feature/todo/presentation/widget/to_do_list_tile.dart';

class ToDosListWidget extends StatelessWidget {
  const ToDosListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoBloc, ToDoState>(
      listener: (context, state) {
        if (state is ToDoErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        log(state.toString());
        if (state is ToDoLoadedState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.toDos.length,
              itemBuilder: (context, index) {
                final toDo = state.toDos.elementAt(index);
                return ToDoListTile(toDo: toDo);
              },
            ),
          );
        } else if (state is FetchToDoErrorState) {
          Center(
            child: Text(state.errorMessage),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
