import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:notedo/feature/dashboard/presentation/cubit/dashboard_state.dart';

import 'widget/navigation_bar_widget.dart';
import 'widget/navigation_rail_widget.dart';

class DashboardScreen extends StatelessWidget {
  final Widget body;
  const DashboardScreen({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TO CHECK WETHER THE PLATFORM IS MOBILE
    bool isMobile = defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;

    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.appBarTitle),
              scrolledUnderElevation: 0,
            ),
            body: Row(
              children: [
                if (!isMobile) ...[
                  NavigationRailWidget(
                    onTapAddButton: () => _onTapAddButton(state),
                  ),
                ],
                Expanded(
                  child: body,
                ),
              ],
            ),
            bottomNavigationBar: isMobile ? const NavigationBarWidget() : null,
            // CHECKING FOR MOBILE AND PAGE INDEX IS NOT SETTING FOR SHOWING ADD FLOTING ACTION BUTTON
            floatingActionButton: isMobile && state.pageIndex != 2
                ? FloatingActionButton(
                    elevation: 0,
                    onPressed: () => _onTapAddButton(state),
                    child: const Icon(Icons.edit_outlined),
                  )
                : null,
          );
        },
      ),
    );
  }

  void _onTapAddButton(DashboardState state) {
    switch (state.pageIndex) {
      case 0:
        //TODO:GOTO  ADD NOTE ROUTE
        print('ADD NOTE');
        break;
      case 1:
        //TODO:GOTO ADD TODO ROUTE
        print('ADD TODO');
        break;
      default:
        throw Exception('SOmthing went Wrong');
    }
  }
}
