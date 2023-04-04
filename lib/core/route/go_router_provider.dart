import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notedo/core/route/route_const_names.dart';
import 'package:notedo/feature/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:notedo/feature/note/presentation/ui/note_screen.dart';
import 'package:notedo/feature/setting/presentation/ui/setting_screen.dart';
import 'package:notedo/feature/todo/presentation/ui/to_do_screen.dart';

class GoRouterProvider {
  GoRouterProvider();

  final GlobalKey<NavigatorState> _shellkey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  final GlobalKey<NavigatorState> _rootkey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  GoRouter goRouter() => GoRouter(
        debugLogDiagnostics: true,
        navigatorKey: _rootkey,
        initialLocation: '/',
        routes: [
          ShellRoute(
              navigatorKey: _shellkey,
              builder: (context, state, child) => DashboardScreen(body: child),
              routes: [
                GoRoute(
                  path: '/',
                  name: RouteName.note,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: NoteScreen(),
                  ),
                ),
                GoRoute(
                  path: '/to-do',
                  name: RouteName.toDo,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ToDoScreen(),
                  ),
                ),
                GoRoute(
                  path: '/setting',
                  name: RouteName.setting,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: SettingScreen(),
                  ),
                ),
              ]),
        ],
      );
}
