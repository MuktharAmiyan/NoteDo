import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'core/route/go_router_provider.dart';
import 'core/service_locator.dart';
import 'feature/setting/presentation/cubit/theme/theme_cubit.dart';

class NoteDoApp extends StatelessWidget {
  const NoteDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>()..initTheme(),
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
