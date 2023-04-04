import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:notedo/feature/setting/domain/usecases/init_theme_usecase.dart';
import 'package:notedo/feature/setting/domain/usecases/set_color_scheme.dart';
import 'package:notedo/feature/setting/domain/usecases/set_theme_mode.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final InitThemeUsecase initThemeUsecase;
  final SetThemeModeUsecase setThemeModeUsecase;
  final SetColorSchemeUsecase setColorSchemeUsecase;

  ThemeCubit({
    required this.initThemeUsecase,
    required this.setThemeModeUsecase,
    required this.setColorSchemeUsecase,
  }) : super(const ThemeInitialState());

  Future<void> initTheme() async {
    final res = await initThemeUsecase.call(NoParams());
    emit(
      res.fold(
        (l) => state,
        (r) => ThemeNewState(
          brightness: r.brightness,
          appColorScheme: r.appColorScheme,
        ),
      ),
    );
  }

  Future<void> changeThemeModeTheme({
    required Brightness brightness,
  }) async {
    final res = await setThemeModeUsecase.call(brightness);
    emit(
      res.fold(
        (l) => state,
        (r) => ThemeNewState(
          brightness: r,
          appColorScheme: state.appColorScheme,
        ),
      ),
    );
  }

  Future<void> changeThemeColorScheme(
      {required AppColorScheme appColorScheme}) async {
    final res = await setColorSchemeUsecase.call(appColorScheme);
    emit(
      res.fold(
        (l) => state,
        (r) => ThemeNewState(
          brightness: state.brightness,
          appColorScheme: r,
        ),
      ),
    );
  }
}
