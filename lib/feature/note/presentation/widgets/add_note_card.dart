import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notedo/core/route/route_const_names.dart';

class AddNoteCard extends StatelessWidget {
  const AddNoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.addNote);
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADD NOTE  ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.edit)
          ],
        ),
      ),
    );
  }
}
