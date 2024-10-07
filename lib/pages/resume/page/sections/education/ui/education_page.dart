import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections_widgets.dart';
import 'package:resume_crafter/pages/resume/page/sections/education/cubit/education_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.education),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  ValidatedTextField(
                    validationValue: state.university,
                    label: context.l10n.university,
                    isRequired: true,
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.degree,
                    label: context.l10n.degree,
                    isRequired: true,
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.description,
                    label: context.l10n.description,
                    minLines: 5,
                    isRequired: true,
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.major,
                    label: context.l10n.major,
                    isRequired: true,
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.rating,
                    label: context.l10n.rating,
                    isRequired: true,
                  ),
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.specialization,
                    label: context.l10n.specialization,
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
                  ElevatedButton(
                    onPressed: () {
                      final education =
                          context.read<EducationCubit>().buildEducation();
                      if (education == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error while saving education'),
                          ),
                        );
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context.read<ResumeCubit>().updateEducation(education);
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
