import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        UserRoute(),
        MenuRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        backgroundColor: white,
        selectedItemColor: blue,
        unselectedItemColor: deepGrey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) async {
          tabsRouter.setActiveIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 25.sp,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 25.sp,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_add_outlined,
              size: 25.sp,
            ),
            activeIcon: Icon(
              Icons.person_add,
              size: 25.sp,
            ),
            label: 'Add beneficiary',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_outlined,
              size: 25.sp,
            ),
            activeIcon: Icon(
              Icons.menu,
              size: 25.sp,
            ),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
