// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/foundation.dart' as _i13;
import 'package:flutter/material.dart' as _i12;

import '../../../features/auth/presentation/pages/forgot_password_page.dart'
    as _i6;
import '../../../features/auth/presentation/pages/login_page.dart' as _i4;
import '../../../features/auth/presentation/pages/register_page.dart' as _i5;
import '../../../features/jobs/domain/models/job.dart' as _i14;
import '../../../features/jobs/presentation/pages/job_detail_page.dart' as _i9;
import '../../../features/jobs/presentation/pages/job_home.dart' as _i7;
import '../../../features/jobs/presentation/pages/job_listing_page.dart' as _i8;
import '../../../features/jobs/presentation/pages/jobs.dart' as _i2;
import '../../../features/main/presentation/pages/main_page.dart' as _i1;
import '../../../features/profile/presentation/pages/profile.dart' as _i3;
import '../../../features/profile/presentation/pages/profile_home_page.dart'
    as _i10;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    JobRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.JobsPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ForgotPasswordPage(),
      );
    },
    JobBoardRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.JobBoardPage(),
      );
    },
    JobListingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.JobListingPage(),
      );
    },
    JobDetailRoute.name: (routeData) {
      final args = routeData.argsAs<JobDetailRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.JobDetailPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    ProfileHomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileHomePage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i11.RouteConfig(
              JobRouter.name,
              path: 'jobs',
              parent: MainRoute.name,
              children: [
                _i11.RouteConfig(
                  JobBoardRoute.name,
                  path: '',
                  parent: JobRouter.name,
                ),
                _i11.RouteConfig(
                  JobListingRoute.name,
                  path: 'hotel',
                  parent: JobRouter.name,
                ),
                _i11.RouteConfig(
                  JobDetailRoute.name,
                  path: 'jobDetail',
                  parent: JobRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: MainRoute.name,
              children: [
                _i11.RouteConfig(
                  ProfileHomeRoute.name,
                  path: '',
                  parent: ProfileRouter.name,
                )
              ],
            ),
            _i11.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              RegisterRoute.name,
              path: 'register',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              ForgotPasswordRoute.name,
              path: 'forgotPassword',
              parent: MainRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.JobsPage]
class JobRouter extends _i11.PageRouteInfo<void> {
  const JobRouter({List<_i11.PageRouteInfo>? children})
      : super(
          JobRouter.name,
          path: 'jobs',
          initialChildren: children,
        );

  static const String name = 'JobRouter';
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRouter extends _i11.PageRouteInfo<void> {
  const ProfileRouter({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i6.ForgotPasswordPage]
class ForgotPasswordRoute extends _i11.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: 'forgotPassword',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i7.JobBoardPage]
class JobBoardRoute extends _i11.PageRouteInfo<void> {
  const JobBoardRoute()
      : super(
          JobBoardRoute.name,
          path: '',
        );

  static const String name = 'JobBoardRoute';
}

/// generated route for
/// [_i8.JobListingPage]
class JobListingRoute extends _i11.PageRouteInfo<void> {
  const JobListingRoute()
      : super(
          JobListingRoute.name,
          path: 'hotel',
        );

  static const String name = 'JobListingRoute';
}

/// generated route for
/// [_i9.JobDetailPage]
class JobDetailRoute extends _i11.PageRouteInfo<JobDetailRouteArgs> {
  JobDetailRoute({
    _i13.Key? key,
    required _i14.Job job,
  }) : super(
          JobDetailRoute.name,
          path: 'jobDetail',
          args: JobDetailRouteArgs(
            key: key,
            job: job,
          ),
        );

  static const String name = 'JobDetailRoute';
}

class JobDetailRouteArgs {
  const JobDetailRouteArgs({
    this.key,
    required this.job,
  });

  final _i13.Key? key;

  final _i14.Job job;

  @override
  String toString() {
    return 'JobDetailRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [_i10.ProfileHomePage]
class ProfileHomeRoute extends _i11.PageRouteInfo<void> {
  const ProfileHomeRoute()
      : super(
          ProfileHomeRoute.name,
          path: '',
        );

  static const String name = 'ProfileHomeRoute';
}
