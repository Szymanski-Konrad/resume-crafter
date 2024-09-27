import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections_widgets.dart';
import 'package:resume_crafter/pages/resume/page/sections/experience/cubit/experience_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperienceCubit, ExperienceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.experience),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  ValidatedTextField(
                    validationValue: state.company,
                    label: context.l10n.company,
                    isRequired: true,
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.position,
                    label: context.l10n.position,
                    isRequired: true,
                  ),
                  Gap.l,
                  Row(
                    children: [
                      Expanded(
                        child: DateTimePicker(
                          title: context.l10n.startDate,
                          validationValue: state.startDate,
                          onUpdate: () {
                            state.startDate.isValid;
                          },
                        ),
                      ),
                      Gap.l,
                      Expanded(
                        child: DateTimePicker(
                          title: context.l10n.endDate,
                          validationValue: state.endDate,
                          onUpdate: () {
                            state.endDate.isValid;
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.description,
                    label: context.l10n.description,
                    minLines: 10,
                    isRequired: true,
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final experience =
                          context.read<ExperienceCubit>().buildExperience();
                      if (experience == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error while saving experience'),
                          ),
                        );
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context.read<ResumeCubit>().updateExperience(experience);
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
