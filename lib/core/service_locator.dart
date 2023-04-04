import 'package:get_it/get_it.dart';
import 'package:notedo/core/route/go_router_provider.dart';
import 'package:notedo/feature/setting/data/data_source/setting_local_data_source.dart';
import 'package:notedo/feature/setting/data/repository/setting_repository_impl.dart';
import 'package:notedo/feature/setting/domain/repository/settings_repository.dart';
import 'package:notedo/feature/setting/presentation/cubit/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorInit() async {
  getIt.registerFactory(
    () => GoRouterProvider(),
  );

  //FEATURE

  //SETTING

  //BLOC
  getIt.registerFactory(
    () => ThemeCubit(
      settingsRepository: getIt(),
    ),
  );

  //REPOSITORY
  getIt.registerLazySingleton<SettingRepository>(
    () => SettingRepositoryImpl(
      settinglocalDataSource: getIt(),
    ),
  );

  //DATASOURCE
  getIt.registerLazySingleton<SettinglocalDataSource>(
    () => SettinglocalDataSourceImpl(
      sharedPreferences: getIt(),
    ),
  );
  //EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
