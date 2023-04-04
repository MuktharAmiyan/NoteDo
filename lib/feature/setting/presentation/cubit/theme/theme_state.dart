part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final Brightness brightness;
  final AppColorScheme appColorScheme;

  const ThemeState({
    required this.brightness,
    required this.appColorScheme,
  });

  @override
  List<Object> get props => [brightness, appColorScheme];
}

class ThemeInitialState extends ThemeState {
  const ThemeInitialState({
    super.brightness = Brightness.light,
    super.appColorScheme = AppColorScheme.purple,
  });
  @override
  List<Object> get props => [brightness, appColorScheme];
}

class ThemeNewState extends ThemeState {
  const ThemeNewState({
    required super.brightness,
    required super.appColorScheme,
  });
  @override
  List<Object> get props => [brightness, appColorScheme];
}
