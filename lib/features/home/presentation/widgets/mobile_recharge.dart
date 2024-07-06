import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/features/home/presentation/cubits/get_transactions/get_transactions_cubit.dart';
import 'package:top_up_test/features/home/presentation/widgets/history.dart';
import 'package:top_up_test/features/home/presentation/widgets/recharge.dart';

class MobileRecharge extends StatefulWidget {
  const MobileRecharge({super.key});

  @override
  State<MobileRecharge> createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: GenericText(
            text: 'Mobile Recharge',
            weight: FontWeight.w700,
            size: 20.sp,
            color: blue,
          ),
        ),
        ColumnSizedBox(10.h),
        Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _toggle = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _toggle ? white : grey,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: GenericText(
                      text: 'Recharge',
                      size: 14.sp,
                      color: _toggle ? blue : deepGrey,
                      weight: _toggle ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _toggle = false;
                    context.read<GetTransactionsCubit>().getTransactions();
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _toggle ? grey : white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: GenericText(
                      text: 'History',
                      size: 14.sp,
                      color: _toggle ? deepGrey : blue,
                      weight: _toggle ? FontWeight.normal : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ColumnSizedBox(15.h),
        _toggle ? const Recharge() : const History(),
      ],
    );
  }
}
