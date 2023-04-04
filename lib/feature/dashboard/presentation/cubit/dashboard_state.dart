import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  final int pageIndex;
  final String appBarTitle;
  const DashboardState({
    required this.pageIndex,
    required this.appBarTitle,
  });

  @override
  List<Object?> get props => [
        pageIndex,
        appBarTitle,
      ];
}

class NoteDashboardState extends DashboardState {
  const NoteDashboardState()
      : super(
          pageIndex: 0,
          appBarTitle: 'Note',
        );
}

class ToDoDashboardState extends DashboardState {
  const ToDoDashboardState()
      : super(
          pageIndex: 1,
          appBarTitle: 'To Do',
        );
}

class SettingDashboardState extends DashboardState {
  const SettingDashboardState()
      : super(
          pageIndex: 2,
          appBarTitle: 'Setting',
        );
}
