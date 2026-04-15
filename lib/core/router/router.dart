import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vd_login/common/blocs/auth/auth_cubit.dart';
import 'package:vd_login/common/blocs/auth/auth_state.dart';
import 'package:vd_login/core/di/injection.dart';
import 'package:vd_login/core/router/app_routes.dart';
import 'package:vd_login/core/router/router_refresh.dart';
import 'package:vd_login/presentation/preen/login/bloc/login_cubit.dart';
import 'package:vd_login/presentation/preen/home/pages/home_page.dart';
import 'package:vd_login/presentation/preen/login/pages/login_page.dart';

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.loading,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),

    redirect: (context, state) {
      final authState = authCubit.state;
      final currentPath = state.matchedLocation;
      final loggingIn = currentPath == AppRoutes.login;

      if (authState is AppInitialState || authState is AuthLoading) {
        return AppRoutes.loading;
      }

      if (authState is UnAuthenticated && !loggingIn) {
        return AppRoutes.login;
      }

      if (authState is Authenticated && loggingIn) {
        return AppRoutes.home;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<LoginCubit>(),
            child: LoginPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.loading,
        builder: (context, state) => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
    ],
  );
}