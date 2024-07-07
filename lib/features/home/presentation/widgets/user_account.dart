import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/core/widgets/row_sized_box.dart';
import 'package:top_up_test/features/home/presentation/cubits/current_user/current_user_cubit.dart';
import 'package:top_up_test/features/home/presentation/widgets/pic_circle.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentUserCubit, CurrentUserState>(
      builder: (context, state) {
        return state is Loaded
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        PicCircle(
                            name: '${state.userEntity.firstName} ${state.userEntity.lastName}'),
                        RowSizedBox(10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const GenericText(
                              text: 'Welcome back',
                              weight: FontWeight.w600,
                              color: blue,
                            ),
                            Row(
                              children: [
                                GenericText(
                                  text:
                                      '${state.userEntity.firstName} ${state.userEntity.lastName}',
                                  size: 14.sp,
                                  color: blue,
                                ),
                                RowSizedBox(6.w),
                                Icon(
                                  Icons.verified_outlined,
                                  size: 16.sp,
                                  color: blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.notifications,
                          size: 20.sp,
                          color: blue,
                        ),
                      ],
                    ),
                    ColumnSizedBox(20.h),
                    GenericText(
                      text: 'Account Balance',
                      size: 14.sp,
                      color: deepGrey,
                    ),
                    GenericText(
                      text: state.userEntity.accountBalance.toString(),
                      size: 35.sp,
                      color: blue,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
