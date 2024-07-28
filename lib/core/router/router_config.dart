import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/ui/home/home_page.dart';
import 'package:resume_crafter/ui/sign_in/sign_in_page.dart';
import 'package:resume_crafter/ui/sign_up/sign_up_page.dart';

final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          return const SignInPage();
        },
        routes: [
          GoRoute(
            name: AppRoutes.signIn,
            path: AppRoutes.signIn,
            builder: (context, state) {
              return const SignInPage();
            },
          ),
          GoRoute(
            name: AppRoutes.signUp,
            path: AppRoutes.signUp,
            builder: (context, state) {
              return const SignUpPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [],
      ),
    ],
    redirect: (context, state) async {
      debugPrint(state.fullPath);
      if (state.fullPath?.startsWith('/auth') == true) {
        return null;
      }
      final user = await locator.get<BaseAuthRepository>().getCurrentUser();
      if (user == null) return '/auth/${AppRoutes.signIn}';
      return null;
    });
