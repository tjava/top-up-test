import 'package:flutter/material.dart';

class RowSizedBox extends StatelessWidget {
  final double width;

  const RowSizedBox(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
