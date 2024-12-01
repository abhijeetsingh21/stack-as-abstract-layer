import 'package:flutter/widgets.dart';

class Layer {
  final Widget child;
  final double expandedHeight;
  final double collapsedHeight;

  Layer({
    required this.child,
    this.expandedHeight = 500.0,
    this.collapsedHeight = 300.0,
  });
}