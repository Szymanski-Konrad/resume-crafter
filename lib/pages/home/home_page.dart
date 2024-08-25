import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/bloc/home/home_cubit.dart';
import 'package:resume_crafter/bloc/home/home_state.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.welcomeUser('Peter')),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.goNamed(AppRoutes.resumeBuilder),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(context.l10n.createNewResume),
                  onTap: () => context.goNamed(AppRoutes.resumeBuilder),
                ),
                ...state.resumesMetadata.map((e) => ListTile(
                      title: Text(e.name),
                      subtitle: Text(
                        '${context.l10n.createdAt}: ${e.createdAt.toString()}',
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
