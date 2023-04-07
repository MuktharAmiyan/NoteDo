import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
        scrolledUnderElevation: 0,
      ),
      body: const Center(
        child: Text('ToDOSS'),
      ),
    );
  }
}
