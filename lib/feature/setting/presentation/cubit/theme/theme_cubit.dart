import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SettingRepository settingsRepository;
  ThemeCubit({
    required this.settingsRepository,
  }) : super(const ThemeInitialState());

  Future<void> initTheme() async {
    final res = await settingsRepository.initTheme();
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
    final res = await settingsRepository.setThemeMode(brightness);
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
    final res = await settingsRepository.setColorScheme(appColorScheme);
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
