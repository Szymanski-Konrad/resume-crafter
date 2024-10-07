import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections_widgets.dart';
import 'package:resume_crafter/pages/resume/page/sections/publications/cubit/publications_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class PublicationsPage extends StatelessWidget {
  const PublicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicationsCubit, PublicationsState>(
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
                  DateTimePicker(
                    title: context.l10n.publishDate,
                    validationValue: state.publishDate,
                    onUpdate: () {
                      state.publishDate.isValid;
                    },
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final publication =
                          context.read<PublicationsCubit>().buildPublication();
                      if (publication == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Error while saving publication')));
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context
                          .read<ResumeCubit>()
                          .updatePublications(publication);
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
