import 'package:flutter/material.dart';

/// Display widget based on boolean [value]
class DualWidget extends StatelessWidget {
  final Widget trueWidget, falseWidget;
  final bool value;

  const DualWidget({
    Key? key,
    required this.value,
    required this.trueWidget,
    required this.falseWidget,
  }) : super(key: key);

  const DualWidget.nullable({
    Key? key,
    required this.value,
    this.trueWidget = const SizedBox.shrink(),
    this.falseWidget = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => value ? trueWidget : falseWidget;
}
