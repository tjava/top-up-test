import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/utils/helper_func.dart';
import 'package:top_up_test/core/utils/snack_bar.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/features/home/presentation/cubits/get_transactions/get_transactions_cubit.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTransactionsCubit, GetTransactionsState>(
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
            ? state.transactions.isEmpty
                ? Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: GenericText(
                      text: 'Empty',
                      size: 14.sp,
                      color: blue,
                      weight: FontWeight.w700,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int index = 0; index < state.transactions.length; index++) ...[
                          ListTile(
                            leading: Icon(
                              Icons.north,
                              color: red,
                              size: 20.sp,
                            ),
                            title: GenericText(
                              text: state.transactions[index].topUpOption,
                              size: 14.sp,
                              color: blue,
                            ),
                            subtitle: GenericText(
                              text:
                                  '${state.transactions[index].user.firstName} ${state.transactions[index].user.lastName}',
                              size: 14.sp,
                              color: deepGrey,
                            ),
                            trailing: GenericText(
                              text: dateFormatter(state.transactions[index].createdAt!),
                              size: 14.sp,
                              color: blue,
                            ),
                          ),
                          ColumnSizedBox(10.w),
                        ],
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
