import 'package:flutter/material.dart';

import '../widgets/theme_setting_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ThemeSettingTileWidget(),
      ],
    );
  }
}
