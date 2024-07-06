import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/features/home/presentation/cubits/get_transactions/get_transactions_cubit.dart';
import 'package:top_up_test/features/home/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:top_up_test/features/home/presentation/widgets/mobile_recharge.dart';
import 'package:top_up_test/features/home/presentation/widgets/user_account.dart';
import 'package:top_up_test/locator/locate.dart';

@RoutePage<dynamic>()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetUsersCubit _getUsersCubit;
  late GetTransactionsCubit _getTransactionsCubit;

  @override
  void initState() {
    super.initState();
    _getUsersCubit = locate<GetUsersCubit>();
    _getTransactionsCubit = locate<GetTransactionsCubit>();

    _getUsersCubit.getUsers();
  }

  @override
  void dispose() {
    _getUsersCubit.close();
    _getTransactionsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUsersCubit>.value(value: _getUsersCubit),
        BlocProvider<GetTransactionsCubit>.value(value: _getTransactionsCubit),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const UserAccount(),
                ColumnSizedBox(20.h),
                const MobileRecharge(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
