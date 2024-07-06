import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/utils/snack_bar.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/core/widgets/row_sized_box.dart';
import 'package:top_up_test/features/home/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:top_up_test/features/home/presentation/widgets/recharge_card.dart';

class Recharge extends StatelessWidget {
  const Recharge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUsersCubit, GetUsersState>(
      listener: (context, state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar(
              context: context,
              message: state.message,
              color: red,
            ),
          );
        }
      },
      builder: (context, state) {
        return state is Loaded
            ? state.users.isEmpty
                ? Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: GenericText(
                      text: 'No active beneficiaries',
                      size: 14.sp,
                      color: blue,
                      weight: FontWeight.w700,
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RowSizedBox(15.w),
                        for (int index = 0; index < state.users.length; index++) ...[
                          RechargeCard(userEntity: state.users[index]),
                          RowSizedBox(10.w),
                        ],
                        RowSizedBox(15.w),
                      ],
                    ),
                  )
            : Container(
                height: 120,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: blue),
              );
      },
    );
  }
}
