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
            body: Row(
              children: [
                if (!isMobile) ...[
                  const NavigationRailWidget(),
                ],
                Expanded(
                  child: body,
                ),
              ],
            ),
            bottomNavigationBar: isMobile ? const NavigationBarWidget() : null,
          );
        },
      ),
    );
  }
}
