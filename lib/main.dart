import 'package:flutter/material.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/core/router/router_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
      onGenerateTitle: (context) => context.l10n.appTitle,
      title: 'Resume Crafter QA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
    );
  }
}
