import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  final int pageIndex;

  const DashboardState({
    required this.pageIndex,
  });

  @override
  List<Object?> get props => [
        pageIndex,
      ];
}

class NoteDashboardState extends DashboardState {
  const NoteDashboardState()
      : super(
          pageIndex: 0,
        );
}

class ToDoDashboardState extends DashboardState {
  const ToDoDashboardState()
      : super(
          pageIndex: 1,
        );
}

class SettingDashboardState extends DashboardState {
  const SettingDashboardState()
      : super(
          pageIndex: 2,
        );
}
