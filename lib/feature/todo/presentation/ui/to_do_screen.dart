import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/core/service_locator.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do_type/to_do_type_cubit.dart';
import 'package:notedo/feature/todo/presentation/widget/add_to_do_widget.dart';
import 'package:notedo/feature/todo/presentation/widget/to_do_type_picker_widget.dart';
import 'package:notedo/feature/todo/presentation/widget/to_dos_list_widget.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ToDoTypeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To Do'),
          scrolledUnderElevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ToDoTypePicker(),
            AddToDoWidget(),
            ToDosListWidget(),
          ],
        ),
      ),
    );
  }
}
