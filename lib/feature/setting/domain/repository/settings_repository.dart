import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';

abstract class SettingRepository {
  Future<Either<Failure, AppThemeModel>> initTheme();
  Future<Either<Failure, Brightness>> setThemeMode(Brightness brightness);
  Future<Either<Failure, AppColorScheme>> setColorScheme(
      AppColorScheme appColorScheme);
}
