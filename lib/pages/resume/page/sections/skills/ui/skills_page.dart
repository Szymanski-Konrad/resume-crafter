import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/skills/cubit/skills_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsCubit, SkillsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.skills),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  ValidatedTextField(
                    validationValue: state.name,
                    label: context.l10n.name,
                    isRequired: true,
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final skill = context.read<SkillsCubit>().buildSkill();
                      if (skill == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error while saving experience'),
                          ),
                        );
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context.read<ResumeCubit>().updateSkill(skill);
                      context.pop();
                    },
                    child: const Text('Save changes'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
