import 'package:flutter/material.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettinglocalDataSource {
  Future<AppThemeModel> initTheme();
  Future<Brightness> setThemeMode(Brightness brightness);
  Future<AppColorScheme> setColorScheme(AppColorScheme appColorScheme);
}

const _themeMode = 'THEME_MODE';
const _themeColorScheme = 'THEME_COLOR_SCHEME';

class SettinglocalDataSourceImpl extends SettinglocalDataSource {
  final SharedPreferences sharedPreferences;
  SettinglocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<AppThemeModel> initTheme() async {
    final thememode = sharedPreferences.getString(_themeMode);
    final themeColorScheme = sharedPreferences.getString(_themeColorScheme);
    var appThemeModel = const AppThemeModel(
      brightness: Brightness.light,
      appColorScheme: AppColorScheme.purple,
    );
    if (thememode == null) {
      sharedPreferences.setString(
        _themeMode,
        ThemeMode.light.name,
      );
    } else {
      appThemeModel = appThemeModel.copyWith(
        brightness: Brightness.values.byName(thememode),
      );
    }
    if (themeColorScheme == null) {
      sharedPreferences.setString(
        _themeColorScheme,
        AppColorScheme.purple.name,
      );
    } else {
      appThemeModel = appThemeModel.copyWith(
        appColorScheme: AppColorScheme.values.byName(
          themeColorScheme,
        ),
      );
    }
    return appThemeModel;
  }

  @override
  Future<AppColorScheme> setColorScheme(AppColorScheme appColorScheme) async {
    await sharedPreferences.setString(_themeColorScheme, appColorScheme.name);
    return appColorScheme;
  }

  @override
  Future<Brightness> setThemeMode(Brightness brightness) async {
    await sharedPreferences.setString(_themeMode, brightness.name);
    return brightness;
  }
}
