import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resume_crafter/bloc/auth/auth_cubit.dart';
import 'package:resume_crafter/bloc/home/home_cubit.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/core/router/router_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/repositories/auth/resume/base_resume_repository.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator().configure();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(
            authRepository: locator.get<BaseAuthRepository>(),
            resumeRepository: locator.get<BaseResumeRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => AuthCubit(
            authRepository: locator.get<BaseAuthRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
        onGenerateTitle: (context) => context.l10n.appTitle,
        title: 'Resume Crafter QA',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
      ),
    );
  }
}
