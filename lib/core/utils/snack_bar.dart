import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';

SnackBar showSnackBar(
    {required BuildContext context, required String message, Color color = green}) {
  return SnackBar(
    content: GenericText(
      text: message,
      size: 12.sp,
      color: white,
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 3),
    showCloseIcon: true,
  );
}
