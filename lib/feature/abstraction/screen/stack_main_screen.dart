import 'package:cred_demo_application/core/abs_layer/abs_layer.dart';
import 'package:cred_demo_application/core/abstraction_layer/abstraction_layer.dart';
import 'package:cred_demo_application/feature/abstraction/provider/stack_provider.dart';
import 'package:cred_demo_application/feature/abstraction/widgets/card_one.dart';
import 'package:cred_demo_application/feature/abstraction/widgets/card_three.dart';
import 'package:cred_demo_application/feature/abstraction/widgets/card_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedStackedWidgetsApp extends StatefulWidget {
  const AnimatedStackedWidgetsApp({super.key});

  @override
  State<AnimatedStackedWidgetsApp> createState() =>
      _AnimatedStackedWidgetsAppState();
}

class _AnimatedStackedWidgetsAppState extends State<AnimatedStackedWidgetsApp> {
  @override
  void initState() {
    context.read<StackState>().getCardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Consumer<StackState>(
          builder: (context, stackState, _) {
            if (stackState.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return StackFramework(
              layers: [
                Layer(
                  child: CardOne(
                    stackState: stackState,
                  ),
                ),
                Layer(
                  child: CardTwo(
                    stackState: stackState,
                  ),
                ),
                Layer(
                    child: CardThree(
                  stackState: stackState,
                )),
              ],
              expandedIndex: stackState.expandedIndex,
              onLayerTapped: (index) => stackState.toggleIndex(index),
            );
          },
        ),
      ),
    );
  }
}
