import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notedo/core/route/route_const_names.dart';
import 'package:notedo/feature/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:notedo/feature/dashboard/presentation/cubit/dashboard_state.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.pageIndex,
          onDestinationSelected: (index) =>
              _onDestinationSelected(context, index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.note_alt_outlined),
              label: 'Note',
            ),
            NavigationDestination(
              icon: Icon(Icons.today_outlined),
              label: 'ToDo',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }

  void _onDestinationSelected(BuildContext context, int pageIndex) {
    context.read<DashboardCubit>().onDestinationSelected(pageIndex);
    switch (pageIndex) {
      case 0:
        context.goNamed(RouteName.note);
        break;
      case 1:
        context.goNamed(RouteName.toDo);
        break;
      case 2:
        context.goNamed(RouteName.setting);
        break;
      default:
        throw Exception('Somthing went wrong !');
    }
  }
}
