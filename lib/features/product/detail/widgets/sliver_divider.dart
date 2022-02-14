import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  final double height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color color;

  const SliverDivider({
    required this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    required this.color,
  })  : assert(height >= 0.0),
        assert(thickness == null || thickness >= 0.0),
        assert(indent == null || indent >= 0.0),
        assert(endIndent == null || endIndent >= 0.0);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        height: height,
        thickness: thickness,
        indent: indent,
        color: color,
      ),
    );
  }
}
