// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:top_up_test/features/home/presentation/pages/home_page.dart'
    as _i1;
import 'package:top_up_test/features/home/presentation/pages/top_up_page.dart'
    as _i4;
import 'package:top_up_test/features/layout/presentation/pages/layout_page.dart'
    as _i2;
import 'package:top_up_test/features/user/domain/entities/user_entity.dart'
    as _i8;
import 'package:top_up_test/features/user/presentation/pages/menu_page.dart'
    as _i3;
import 'package:top_up_test/features/user/presentation/pages/user_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LayoutRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LayoutPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MenuPage(),
      );
    },
    TopUpRoute.name: (routeData) {
      final args = routeData.argsAs<TopUpRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.TopUpPage(
          key: args.key,
          userEntity: args.userEntity,
        ),
      );
    },
    UserRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.UserPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LayoutPage]
class LayoutRoute extends _i6.PageRouteInfo<void> {
  const LayoutRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MenuPage]
class MenuRoute extends _i6.PageRouteInfo<void> {
  const MenuRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TopUpPage]
class TopUpRoute extends _i6.PageRouteInfo<TopUpRouteArgs> {
  TopUpRoute({
    _i7.Key? key,
    required _i8.UserEntity userEntity,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TopUpRoute.name,
          args: TopUpRouteArgs(
            key: key,
            userEntity: userEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'TopUpRoute';

  static const _i6.PageInfo<TopUpRouteArgs> page =
      _i6.PageInfo<TopUpRouteArgs>(name);
}

class TopUpRouteArgs {
  const TopUpRouteArgs({
    this.key,
    required this.userEntity,
  });

  final _i7.Key? key;

  final _i8.UserEntity userEntity;

  @override
  String toString() {
    return 'TopUpRouteArgs{key: $key, userEntity: $userEntity}';
  }
}

/// generated route for
/// [_i5.UserPage]
class UserRoute extends _i6.PageRouteInfo<void> {
  const UserRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
