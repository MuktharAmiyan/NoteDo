import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/setting/data/model/app_theme_model.dart';
import 'package:notedo/feature/setting/presentation/cubit/theme/theme_cubit.dart';

import '../ui/settings_group_tile_widget.dart';

class ThemeSettingTileWidget extends StatelessWidget {
  const ThemeSettingTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SettingsGroupTileWidget(
          groupTitle: 'Theme',
          children: [
            //buildDarkmodeTile,
            SwitchListTile(
              title: const Text('Dark mode'),
              onChanged: (bool value) {
                context.read<ThemeCubit>().changeThemeModeTheme(
                      brightness: value ? Brightness.dark : Brightness.light,
                    );
              },
              value: state.brightness == Brightness.dark,
            ),
            //buildAccentColorTile,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  title: Text('Color scheme'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Wrap(
                    spacing: 10,
                    children:
                        List.generate(AppColorScheme.values.length, (index) {
                      final appColorScheme = AppColorScheme.values[index];
                      return ChoiceChip(
                          onSelected: (value) {
                            context.read<ThemeCubit>().changeThemeColorScheme(
                                appColorScheme: appColorScheme);
                          },
                          label: Text(appColorScheme.getName),
                          selected: state.appColorScheme == appColorScheme);
                    }),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
