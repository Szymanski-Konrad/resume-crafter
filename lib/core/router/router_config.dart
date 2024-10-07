import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/basic_info/cubit/basic_info_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/basic_info/ui/basic_info_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/certificates/cubit/certificate_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/certificates/ui/certificates_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/custom_section/cubit/custom_section_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/custom_section/ui/custom_section_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/education/cubit/education_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/education/ui/education_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/experience/cubit/experience_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/experience/ui/experience_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/languages/cubit/languages_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/languages/ui/languages_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/links/cubit/links_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/links/ui/links_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/personal_project/cubit/personal_project_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/personal_project/ui/personal_project_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/publications/cubit/publications_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/publications/ui/publications_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/reference/cubit/reference_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/reference/ui/reference_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/skills/cubit/skills_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/skills/ui/skills_page.dart';
import 'package:resume_crafter/pages/resume/page/sections/volunteering/cubit/volunteering_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/volunteering/ui/volunteering_page.dart';
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
                GoRoute(
                  name: AppRoutes.experience,
                  path: AppRoutes.experience,
                  builder: (context, state) {
                    final data = state.extra as ResumeExperience?;
                    return BlocProvider(
                      create: (context) => ExperienceCubit(data),
                      child: const ExperiencePage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.education,
                  path: AppRoutes.education,
                  builder: (context, state) {
                    final data = state.extra as ResumeEducation?;
                    return BlocProvider(
                      create: (context) => EducationCubit(data),
                      child: const EducationPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.links,
                  path: AppRoutes.links,
                  builder: (context, state) {
                    final data = state.extra as ResumeLink?;
                    return BlocProvider(
                      create: (context) => LinksCubit(data),
                      child: const LinksPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.skills,
                  path: AppRoutes.skills,
                  builder: (context, state) {
                    final data = state.extra as ResumeSkill?;
                    return BlocProvider(
                      create: (context) => SkillsCubit(data),
                      child: const SkillsPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.certificates,
                  path: AppRoutes.certificates,
                  builder: (context, state) {
                    final data = state.extra as ResumeCertificate?;
                    return BlocProvider(
                      create: (context) => CertificateCubit(data),
                      child: const CertificatesPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.languages,
                  path: AppRoutes.languages,
                  builder: (context, state) {
                    final data = state.extra as ResumeLanguage?;
                    return BlocProvider(
                      create: (context) => LanguagesCubit(data),
                      child: const LanguagesPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.personalProjects,
                  path: AppRoutes.personalProjects,
                  builder: (context, state) {
                    final data = state.extra as ResumePersonalProject?;
                    return BlocProvider(
                      create: (context) => PersonalProjectCubit(data),
                      child: const PersonalProjectPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.publications,
                  path: AppRoutes.publications,
                  builder: (context, state) {
                    final data = state.extra as ResumePublication?;
                    return BlocProvider(
                      create: (context) => PublicationsCubit(data),
                      child: const PublicationsPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.references,
                  path: AppRoutes.references,
                  builder: (context, state) {
                    final data = state.extra as ResumeReference?;
                    return BlocProvider(
                      create: (context) => ReferenceCubit(data),
                      child: const ReferencePage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.volunteering,
                  path: AppRoutes.volunteering,
                  builder: (context, state) {
                    final data = state.extra as ResumeVolunteering?;
                    return BlocProvider(
                      create: (context) => VolunteeringCubit(data),
                      child: const VolunteeringPage(),
                    );
                  },
                ),
                GoRoute(
                  name: AppRoutes.otherSection,
                  path: AppRoutes.otherSection,
                  builder: (context, state) {
                    final data = state.extra as ResumeCustomSection?;
                    return BlocProvider(
                      create: (context) => CustomSectionCubit(data),
                      child: const CustomSectionPage(),
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
