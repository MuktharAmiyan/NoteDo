import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/note/presentation/bloc/bloc/note_bloc.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do/to_do_bloc.dart';
import 'core/route/go_router_provider.dart';
import 'core/service_locator.dart';
import 'feature/setting/presentation/cubit/theme/theme_cubit.dart';

class NoteDoApp extends StatelessWidget {
  const NoteDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeCubit>()..initTheme(),
        ),
        BlocProvider(
          create: (context) => getIt<NoteBloc>()..add(GetAllNoteEvenet()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<ToDoBloc>()..add(const GetToDosEvent(ToDoType.all)),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final route = getIt<GoRouterProvider>();
          return MaterialApp.router(
            title: 'Note Do',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: state.appColorScheme.getColor,
                brightness: state.brightness,
              ),
            ),
            routerConfig: route.goRouter(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
