import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';

class PicCircle extends StatelessWidget {
  final String name;
  const PicCircle({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final newName = name.split(' ');
    return Container(
      height: 40.sp,
      width: 40.sp,
      decoration: const BoxDecoration(color: blue, shape: BoxShape.circle),
      child: Center(
        child: GenericText(
          text: newName.length < 2
              ? newName[0][0].toUpperCase()
              : '${newName[0][0].toUpperCase()}${newName[1][0].toUpperCase()}',
          weight: FontWeight.w700,
          color: white,
        ),
      ),
    );
  }
}
