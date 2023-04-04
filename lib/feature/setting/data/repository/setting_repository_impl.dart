import 'package:flutter/material.dart' show Brightness;
import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/setting/data/data_source/setting_local_data_source.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettinglocalDataSource settinglocalDataSource;
  SettingRepositoryImpl({
    required this.settinglocalDataSource,
  });
  @override
  Future<Either<Failure, AppThemeModel>> initTheme() async {
    try {
      final res = await settinglocalDataSource.initTheme();
      return right(res);
    } catch (_) {
      return left(LocalDataSourceFailure());
    }
  }

  @override
  Future<Either<Failure, AppColorScheme>> setColorScheme(
      AppColorScheme appColorScheme) async {
    try {
      final res = await settinglocalDataSource.setColorScheme(appColorScheme);
      return right(res);
    } catch (_) {
      return left(LocalDataSourceFailure());
    }
  }

  @override
  Future<Either<Failure, Brightness>> setThemeMode(
      Brightness brightness) async {
    try {
      final res = await settinglocalDataSource.setThemeMode(brightness);
      return right(res);
    } catch (_) {
      return left(LocalDataSourceFailure());
    }
  }
}
