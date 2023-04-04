import 'package:flutter/material.dart';

class SettingsGroupTileWidget extends StatelessWidget {
  final String groupTitle;
  final List<Widget> children;
  const SettingsGroupTileWidget({
    super.key,
    required this.groupTitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: .5,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
