import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/core/style/dimensions.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
import 'package:resume_crafter/data/resume_step.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_state.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResumePageView();
  }
}

class ResumePageView extends StatelessWidget {
  const ResumePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ResumeCubit, ResumeState>(
          buildWhen: (prev, curr) =>
              prev.resumeStep != curr.resumeStep ||
              prev.resumeSection != curr.resumeSection,
          builder: (context, state) {
            return Text(
              state.currentStepName(context),
            );
          },
        ),
      ),
      body: Padding(
        padding: AppPaddings.sAllPadding,
        child: BlocBuilder<ResumeCubit, ResumeState>(
          buildWhen: (prev, curr) =>
              prev.resumeStep != curr.resumeStep ||
              prev.resumeSection != curr.resumeSection,
          builder: (context, state) {
            switch (state.resumeStep) {
              case ResumeStep.name:
                return const ResumeNameView();
              case ResumeStep.sections:
                return const ResumeSectionsView();
            }
          },
        ),
      ),
    );
  }
}

class ResumeNameView extends StatelessWidget {
  const ResumeNameView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Check if there is no uncessary rebuilds
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                Text(context.l10n.letStartWithName),
                TextFormField(
                  initialValue: state.resumeName,
                  onChanged: context.read<ResumeCubit>().onSubmitName,
                ),
                Gap.l,
                FilledButton(
                  onPressed: () => context
                      .read<ResumeCubit>()
                      .changeStep(ResumeStep.sections),
                  child: Text(context.l10n.next),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ResumeSectionsView extends StatelessWidget {
  const ResumeSectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ...state.selectedSections.map((section) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.xl),
                  child: ResumeSectionView(section: section),
                );
              }),
              if (state.nonSelectedSections.isNotEmpty) ...[
                Text(
                  context.l10n.whatSectionsYouWant,
                  style: TextStyles.headline2BlackItalic,
                ),
                Gap.m,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.nonSelectedSections
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: AppDimens.s),
                          child: AddSectionChip(section: e),
                        ),
                      )
                      .toList(),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}

class AddSectionChip extends StatelessWidget {
  const AddSectionChip({
    super.key,
    required this.section,
  });

  final ResumeSectionType section;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: Padding(
        padding: AppPaddings.sAllPadding,
        child: Text(
          section.name(context),
          style: TextStyles.bodyBlack,
        ),
      ),
      onPressed: () =>
          context.read<ResumeCubit>().toggleSectionSelection(section),
    );
  }
}
