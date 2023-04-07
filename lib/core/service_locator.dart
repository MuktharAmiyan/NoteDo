import 'package:get_it/get_it.dart';
import 'package:notedo/core/route/go_router_provider.dart';
import 'package:notedo/feature/note/data/data_source/note_local_data_source.dart';
import 'package:notedo/feature/note/data/repository/note_repository_impl.dart';
import 'package:notedo/feature/note/domain/repository/note_repository.dart';
import 'package:notedo/feature/note/domain/use_case/add_note_usecase.dart';
import 'package:notedo/feature/note/domain/use_case/delete_note_usecase.dart';
import 'package:notedo/feature/note/domain/use_case/edit_note_usecase.dart';
import 'package:notedo/feature/note/domain/use_case/get_all_note_usecase.dart';
import 'package:notedo/feature/note/presentation/bloc/bloc/note_bloc.dart';
import 'package:notedo/feature/note/presentation/bloc/note_or_edit/note_or_edit_cubit.dart';
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

  //Note

  //BLOC OR CUBIT

  getIt.registerFactory(
    () => NoteOrEditCubit(),
  );
  getIt.registerFactory(
    () => NoteBloc(
      getAllNoteUsecase: getIt(),
      addNoteUsecase: getIt(),
      deleteNoteUsecase: getIt(),
      editNoteUsecase: getIt(),
    ),
  );

  //Note usecases

  getIt.registerLazySingleton(
    () => GetAllNoteUsecase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => AddNoteUsecase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => DeleteNoteUsecase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => EditNoteUsecase(
      getIt(),
    ),
  );

  //Note Repository
  getIt.registerLazySingleton<NoteRepository>(
    () => NoteRepositoryImpl(
      getIt(),
    ),
  );
  //Note Datasource
  getIt.registerLazySingleton<NoteLocalDataSource>(
    () => NoteLocalDataSourceImpl(),
  );
}
