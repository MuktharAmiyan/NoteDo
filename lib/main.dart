import 'package:flutter/material.dart';
import 'core/service_locator.dart';
import 'note_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocatorInit();
  runApp(
    const NoteDoApp(),
  );
}
