import 'package:d2y_flutter_bloc/core/common/app_routes.dart';
import 'package:d2y_flutter_bloc/presentation/pages/auth/signin_screen.dart';
import 'package:d2y_flutter_bloc/presentation/pages/auth/signup_screen.dart';
import 'package:d2y_flutter_bloc/presentation/pages/errors/error_screen.dart';
import 'package:d2y_flutter_bloc/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter routerinit = GoRouter(
  initialLocation: AppRoutes.SPLASH_ROUTE_PATH,
  routes: <RouteBase>[
    ///  =================================================================
    ///  ********************** Splash Route *****************************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.SPLASH_ROUTE_NAME,
      path: AppRoutes.SPLASH_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    ///  =================================================================
    /// ********************** Authentication Routes ********************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.LOGIN_ROUTE_NAME,
      path: AppRoutes.LOGIN_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      name: AppRoutes.SIGNUP_ROUTE_NAME,
      path: AppRoutes.SIGNUP_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorScreen());
  },
  // redirect: (context, state) {
  //   logger.info('redirect: ${state.uri}');
  //   return null;
  // },
);
