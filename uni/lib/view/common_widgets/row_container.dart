import 'package:flutter/material.dart';

/// App default container
class RowContainer extends StatelessWidget {
  const RowContainer(
      {super.key, required this.child, this.borderColor, this.color,});
  final Widget child;
  final Color? borderColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Theme.of(context).dividerColor, width: 0.5,),
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(7)),),
      child: child,
    );
  }
}
