import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections_widgets.dart';
import 'package:resume_crafter/pages/resume/page/sections/custom_section/cubit/custom_section_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class CustomSectionPage extends StatelessWidget {
  const CustomSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomSectionCubit, CustomSectionState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.customSection),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  ValidatedTextField(
                    validationValue: state.description,
                    label: context.l10n.description,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.name,
                    label: context.l10n.name,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.website,
                    label: context.l10n.website,
                  ),
                  Gap.m,
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
                      final customSection = context
                          .read<CustomSectionCubit>()
                          .buildCustomSection();
                      if (customSection == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Error while saving custom section')));
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context
                          .read<ResumeCubit>()
                          .updateCustomSection(customSection);
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
