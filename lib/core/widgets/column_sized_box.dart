import 'package:flutter/material.dart';

class ColumnSizedBox extends StatelessWidget {
  final double height;

  const ColumnSizedBox(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
