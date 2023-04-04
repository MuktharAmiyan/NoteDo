import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppThemeModel extends Equatable {
  final Brightness brightness;
  final AppColorScheme appColorScheme;
  const AppThemeModel({
    required this.brightness,
    required this.appColorScheme,
  });
  @override
  List<Object?> get props => [];

  AppThemeModel copyWith({
    Brightness? brightness,
    AppColorScheme? appColorScheme,
  }) {
    return AppThemeModel(
      brightness: brightness ?? this.brightness,
      appColorScheme: appColorScheme ?? this.appColorScheme,
    );
  }
}

enum AppColorScheme {
  purple,
  red,
  yellow,
  green,
  blue,
}

extension GetColor on AppColorScheme {
  Color get getColor {
    switch (this) {
      case AppColorScheme.purple:
        return Colors.purple;
      case AppColorScheme.red:
        return Colors.red;
      case AppColorScheme.yellow:
        return Colors.yellow;
      case AppColorScheme.green:
        return Colors.green;
      case AppColorScheme.blue:
        return Colors.blue;
    }
  }
}

extension GetName on AppColorScheme {
  String get getName {
    switch (this) {
      case AppColorScheme.purple:
        return 'Purple';
      case AppColorScheme.red:
        return 'Red';
      case AppColorScheme.yellow:
        return 'Yellow';
      case AppColorScheme.green:
        return 'Green';
      case AppColorScheme.blue:
        return 'Blue';
    }
  }
}
