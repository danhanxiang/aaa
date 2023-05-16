import 'package:flutter/material.dart';


class BKShowDialog extends StatelessWidget {
  BKShowDialog({required this.child, this.constrainedAxis = Axis.horizontal});

  final Widget? child;
  final Axis? constrainedAxis;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
          constrainedAxis:constrainedAxis,
          child: child
    );
  }
}