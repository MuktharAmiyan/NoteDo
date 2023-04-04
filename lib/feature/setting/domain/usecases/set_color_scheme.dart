import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';

import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';

class SetColorSchemeUsecase extends Usecase<AppColorScheme, AppColorScheme> {
  final SettingRepository settingRepository;
  SetColorSchemeUsecase(
    this.settingRepository,
  );
  @override
  Future<Either<Failure, AppColorScheme>> call(AppColorScheme params) =>
      settingRepository.setColorScheme(params);
}
