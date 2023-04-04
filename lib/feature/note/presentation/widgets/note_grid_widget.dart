import 'package:flutter/material.dart';

import 'note_card_widget.dart';

class NoteGridWidget extends StatelessWidget {
  const NoteGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300),
        itemCount: 11,
        itemBuilder: (_, index) => const NoteCardWidget(),
      ),
    );
  }
}
