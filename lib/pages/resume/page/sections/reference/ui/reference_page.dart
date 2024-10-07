import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/reference/cubit/reference_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferenceCubit, ReferenceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.references),
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
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.description,
                    label: context.l10n.description,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.jobTitle,
                    label: context.l10n.jobTitle,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.name,
                    label: context.l10n.name,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.referenceEmail,
                    label: context.l10n.referenceEmail,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.referencePhone,
                    label: context.l10n.referencePhone,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.website,
                    label: context.l10n.website,
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final reference =
                          context.read<ReferenceCubit>().buildReference();
                      if (reference == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Error while saving reference')));
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context.read<ResumeCubit>().updateReference(reference);
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
