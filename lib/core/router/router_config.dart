import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/basic_info/cubit/basic_info_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/basic_info/ui/basic_info_page.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/pages/home/home_page.dart';
import 'package:resume_crafter/pages/resume/page/resume_page.dart';
import 'package:resume_crafter/pages/sign_in/sign_in_page.dart';
import 'package:resume_crafter/pages/sign_up/sign_up_page.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.auth,
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
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (context) => ResumeCubit(),
              child: child,
            );
          },
          routes: [
            GoRoute(
              name: AppRoutes.resumeBuilder,
              path: AppRoutes.resumeBuilder,
              builder: (context, state) {
                return const ResumePage();
              },
              routes: [
                GoRoute(
                  name: AppRoutes.basicInfo,
                  path: AppRoutes.basicInfo,
                  builder: (context, state) {
                    final data = state.extra as ResumeBasics?;
                    return BlocProvider(
                      create: (context) => BasicInfoCubit(data),
                      child: const BasicInfoPage(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  redirect: (context, state) async {
    if (state.fullPath?.startsWith('/auth') == true) {
      return null;
    }
    final user = await locator.get<BaseAuthRepository>().getCurrentUser();
    if (user == null) return '/auth/${AppRoutes.signIn}';
    return null;
  },
);
