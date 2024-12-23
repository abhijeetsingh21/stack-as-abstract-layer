import 'package:cred_demo_application/feature/abstraction/provider/stack_provider.dart';
import 'package:cred_demo_application/feature/abstraction/screen/stack_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StackState(),
      child: const AnimatedStackedWidgetsApp(),
    );
  }
}
