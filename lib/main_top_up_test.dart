import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/utils/globa_keys.dart';
import 'package:top_up_test/features/home/presentation/cubits/current_user/current_user_cubit.dart';
import 'package:top_up_test/locator/locate.dart';
import 'package:top_up_test/navigator/router.dart';

class MainTopUpTest extends StatefulWidget {
  const MainTopUpTest({super.key});

  static final appRouter = AppRouter();

  @override
  State<MainTopUpTest> createState() => _MainTopUpTestState();
}

class _MainTopUpTestState extends State<MainTopUpTest> {
  late CurrentUserCubit _currentUserCubit;

  @override
  void initState() {
    super.initState();
    _currentUserCubit = locate<CurrentUserCubit>();
  }

  @override
  void dispose() {
    _currentUserCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentUserCubit>.value(value: _currentUserCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Top Up Test',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: white,
              appBarTheme: const AppBarTheme(
                backgroundColor: white,
                surfaceTintColor: white,
                centerTitle: true,
                elevation: 0,
                iconTheme: IconThemeData(color: blue),
              ),
            ),
            scaffoldMessengerKey: scaffoldMessengerKey,
            routerConfig: MainTopUpTest.appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
