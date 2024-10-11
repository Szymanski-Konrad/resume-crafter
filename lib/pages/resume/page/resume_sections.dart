import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_state.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections_widgets.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class ResumeSectionView extends StatelessWidget {
  const ResumeSectionView({
    super.key,
    required this.section,
  });

  final ResumeSectionType section;

  @override
  Widget build(BuildContext context) {
    switch (section) {
      case ResumeSectionType.basicInfo:
        return ResumeBasicSectionView(resumeSectionType: section);
      case ResumeSectionType.experience:
        return ResumeExperienceSectionView(resumeSectionType: section);
      case ResumeSectionType.education:
        return ResumeEducationSectionView(resumeSectionType: section);
      case ResumeSectionType.links:
        return ResumeLinkSectionView(resumeSectionType: section);
      case ResumeSectionType.skills:
        return ResumeSkillSectionView(resumeSectionType: section);
      case ResumeSectionType.certificates:
        return ResumeCertificateSectionView(resumeSectionType: section);
      case ResumeSectionType.languages:
        return ResumeLanguageSectionView(resumeSectionType: section);
      case ResumeSectionType.personalProjects:
        return ResumePersonalProjectSectionView(resumeSectionType: section);
      case ResumeSectionType.publications:
        return ResumePublicationSectionView(resumeSectionType: section);
      case ResumeSectionType.refrences:
        return ResumeReferenceSectionView(resumeSectionType: section);
      case ResumeSectionType.volunteering:
        return ResumeVolunteeringSectionView(resumeSectionType: section);
      case ResumeSectionType.customSection:
        return ResumeCustomSectionView(resumeSectionType: section);
    }
  }
}

class ResumeBasicSectionView extends StatelessWidget {
  const ResumeBasicSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final info = state.basics;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.edit,
              onPressed: () =>
                  context.goNamed(AppRoutes.basicInfo, extra: info),
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              InfoIconText(
                icon: Icons.person,
                info: '${info.firstName ?? ''} ${info.lastName ?? ''}',
                placeholder: context.l10n.firstName,
              ),
              InfoIconText(
                icon: Icons.email,
                info: info.email,
                placeholder: context.l10n.email,
              ),
              InfoIconText(
                icon: Icons.phone,
                info: info.phone,
                placeholder: context.l10n.phone,
              ),
              InfoIconText(
                icon: Icons.home,
                info: info.address,
                placeholder: context.l10n.address,
              ),
              InfoIconText(
                icon: Icons.cake,
                info: info.birthday?.toIso8601String(),
                placeholder: context.l10n.birthday,
              ),
              InfoIconText(
                icon: Icons.edit_document,
                info: info.summary,
                placeholder: context.l10n.summary,
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeLinkSectionView extends StatelessWidget {
  const ResumeLinkSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final links = state.links;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.links,
                extra: null,
              ),
            ),
            if (links.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...links.map(
                (e) => LinkShowcase(
                  link: e,
                  onEditTap: () => context.goNamed(AppRoutes.links, extra: e),
                  onRemoveTap: () => context.read<ResumeCubit>().removeLink(e),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeExperienceSectionView extends StatelessWidget {
  const ResumeExperienceSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final experience = state.experience;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.experience,
                extra: null,
              ),
            ),
            if (experience.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...experience.map(
                (item) => ExperienceShowcase(
                  experience: item,
                  onEditTap: () => context.goNamed(
                    AppRoutes.experience,
                    extra: item,
                  ),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeExperience(item),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeEducationSectionView extends StatelessWidget {
  const ResumeEducationSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final education = state.education;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.education,
                extra: null,
              ),
            ),
            if (education.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...education.map(
                (item) => EducationShowcase(
                  education: item,
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeEducation(item),
                  onEditTap: () => context.goNamed(
                    AppRoutes.education,
                    extra: item,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeCertificateSectionView extends StatelessWidget {
  const ResumeCertificateSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final certificates = state.certificates;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.certificates,
                extra: null,
              ),
            ),
            if (certificates.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...certificates.map(
                (e) => CertificateShowcase(
                  certificate: e,
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeCertificate(e),
                  onEditTap: () => context.goNamed(
                    AppRoutes.certificates,
                    extra: e,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeSkillSectionView extends StatelessWidget {
  const ResumeSkillSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final skills = state.skills;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.skills,
                extra: null,
              ),
            ),
            if (skills.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...skills.map(
                (e) => SkillShowcase(
                  skill: e,
                  onEditTap: () => context.goNamed(AppRoutes.skills, extra: e),
                  onRemoveTap: () => context.read<ResumeCubit>().removeSkill(e),
                ),
              )
            ],
          ],
        );
      },
    );
  }
}

class ResumeLanguageSectionView extends StatelessWidget {
  const ResumeLanguageSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final languages = state.languages;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.languages,
                extra: null,
              ),
            ),
            if (languages.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...languages.map(
                (e) => LanguageShowcase(
                  language: e,
                  onEditTap: () =>
                      context.goNamed(AppRoutes.languages, extra: e),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeLanguage(e),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumePersonalProjectSectionView extends StatelessWidget {
  const ResumePersonalProjectSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final personalProjects = state.personalProjects;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.personalProjects,
                extra: null,
              ),
            ),
            if (personalProjects.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...personalProjects.map(
                (e) => PersonalProjectShowcase(
                  personalProject: e,
                  onEditTap: () =>
                      context.goNamed(AppRoutes.personalProjects, extra: e),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removePersonalProject(e),
                ),
              )
            ],
          ],
        );
      },
    );
  }
}

class ResumeReferenceSectionView extends StatelessWidget {
  const ResumeReferenceSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final references = state.references;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.addNew,
              onPressed: () => context.goNamed(
                AppRoutes.references,
                extra: null,
              ),
            ),
            if (references.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...references.map(
                (e) => ReferenceShowcase(
                  reference: e,
                  onEditTap: () =>
                      context.goNamed(AppRoutes.references, extra: e),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeReference(e),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumePublicationSectionView extends StatelessWidget {
  const ResumePublicationSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final publications = state.publications;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () => context.goNamed(
                AppRoutes.publications,
                extra: null,
              ),
            ),
            if (publications.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...publications.map(
                (e) => PublicationShowcase(
                  publication: e,
                  onEditTap: () =>
                      context.goNamed(AppRoutes.publications, extra: e),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removePublication(e),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeVolunteeringSectionView extends StatelessWidget {
  const ResumeVolunteeringSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final volunteering = state.volunteering;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () => context.goNamed(
                AppRoutes.volunteering,
                extra: null,
              ),
            ),
            if (volunteering.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...volunteering.map(
                (e) => VolunteeringShowcase(
                  volunteering: e,
                  onEditTap: () =>
                      context.goNamed(AppRoutes.volunteering, extra: e),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeVolunteering(e),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ResumeCustomSectionView extends StatelessWidget {
  const ResumeCustomSectionView({
    super.key,
    required this.resumeSectionType,
  });

  final ResumeSectionType resumeSectionType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        final customSection = state.customSections;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () => context.goNamed(
                AppRoutes.otherSection,
                extra: null,
              ),
            ),
            if (customSection.isEmpty)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              ...customSection.map(
                (e) => CustomSectionShowcase(
                  customSection: e,
                  onEditTap: () =>
                      context.goNamed(AppRoutes.otherSection, extra: e),
                  onRemoveTap: () =>
                      context.read<ResumeCubit>().removeCustomSection(e),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
