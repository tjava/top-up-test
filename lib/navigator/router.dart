import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: LayoutRoute.page,
      path: '/layout',
      initial: true,
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: '',
          maintainState: false,
        ),
        AutoRoute(
          page: UserRoute.page,
          path: 'user',
          maintainState: false,
        ),
        AutoRoute(
          page: MenuRoute.page,
          path: 'user',
          maintainState: false,
        ),
      ],
    ),
    AutoRoute(
      page: TopUpRoute.page,
      path: '/topUp',
    ),
  ];
}
