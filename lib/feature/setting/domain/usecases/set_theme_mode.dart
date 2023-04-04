import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';

class SetThemeModeUsecase extends Usecase<Brightness, Brightness> {
  final SettingRepository settingRepository;
  SetThemeModeUsecase(
    this.settingRepository,
  );
  @override
  Future<Either<Failure, Brightness>> call(Brightness params) =>
      settingRepository.setThemeMode(params);
}
