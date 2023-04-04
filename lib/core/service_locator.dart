import 'package:get_it/get_it.dart';
import 'package:notedo/core/route/go_router_provider.dart';
import 'package:notedo/feature/setting/data/data_source/setting_local_data_source.dart';
import 'package:notedo/feature/setting/data/repository/setting_repository_impl.dart';
import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';
import 'package:notedo/feature/setting/domain/usecases/init_theme_usecase.dart';
import 'package:notedo/feature/setting/domain/usecases/set_color_scheme.dart';
import 'package:notedo/feature/setting/domain/usecases/set_theme_mode.dart';
import 'package:notedo/feature/setting/presentation/cubit/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorInit() async {
  getIt.registerFactory(() => GoRouterProvider());

  //FEATURE

  //SETTING

  //BLOC
  getIt.registerFactory(() => ThemeCubit(
        initThemeUsecase: getIt(),
        setThemeModeUsecase: getIt(),
        setColorSchemeUsecase: getIt(),
      ));
  //USECASES
  getIt.registerLazySingleton(() => InitThemeUsecase(getIt()));
  getIt.registerLazySingleton(() => SetThemeModeUsecase(getIt()));
  getIt.registerLazySingleton(() => SetColorSchemeUsecase(getIt()));

  //REPOSITORY
  getIt.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(settinglocalDataSource: getIt()));

  //DATASOURCE
  getIt.registerLazySingleton<SettinglocalDataSource>(
      () => SettinglocalDataSourceImpl(sharedPreferences: getIt()));
  //EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
