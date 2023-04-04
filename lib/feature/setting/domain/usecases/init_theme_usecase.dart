import 'package:fpdart/fpdart.dart';

import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';

class InitThemeUsecase extends Usecase<AppThemeModel, NoParams> {
  final SettingRepository settingRepository;
  InitThemeUsecase(
    this.settingRepository,
  );
  @override
  Future<Either<Failure, AppThemeModel>> call(NoParams params) =>
      settingRepository.initTheme();
}
