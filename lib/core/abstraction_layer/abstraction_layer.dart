import 'package:cred_demo_application/core/abs_layer/abs_layer.dart';
import 'package:flutter/material.dart';

class StackFramework extends StatelessWidget {
  final List<Layer> layers;
  final int expandedIndex;
  final Function(int) onLayerTapped;

  const StackFramework({
    required this.layers,
    required this.expandedIndex,
    required this.onLayerTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: List.generate(layers.length, (index) {
        final layer = layers[index];

        // Calculate dynamic positions based on screen height and expanded state
        final double collapsedHeight =
            (screenHeight - layer.expandedHeight) / (layers.length - 1);
        final double topPosition = expandedIndex == -1
            ? index * collapsedHeight
            : (index == expandedIndex
                ? 0
                : index < expandedIndex
                    ? index * collapsedHeight
                    : (index - 1) * collapsedHeight + layer.expandedHeight);

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: topPosition, 
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => onLayerTapped(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: expandedIndex == index
                  ? 800
                  : 700,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2 * (index + 1)),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: layer.child,
            ),
          ),
        );
      }),
    );
  }
}
