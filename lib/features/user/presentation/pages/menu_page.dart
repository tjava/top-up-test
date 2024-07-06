import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';

@RoutePage<dynamic>()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: GenericText(
            text: 'Empty Page',
            size: 14.sp,
            color: blue,
            weight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
