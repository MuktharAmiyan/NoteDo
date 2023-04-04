import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/dashboard/presentation/cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const NoteDashboardState());

  void onDestinationSelected(int newPageIndex) {
    switch (newPageIndex) {
      case 0:
        emit(const NoteDashboardState());
        break;
      case 1:
        emit(const ToDoDashboardState());
        break;
      case 2:
        emit(const SettingDashboardState());
        break;
      default:
        throw Exception('Somthing went wrong !');
    }
  }
}
