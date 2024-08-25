import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/data/resume_model.dart';
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.edit,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.edit,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              type: SectionHeaderType.edit,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
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
        final info = state.basics;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              sectionType: resumeSectionType,
              onPressed: () {},
            ),
            if (info == null)
              SectionHint(sectionType: resumeSectionType)
            else ...[
              Text('Full name: ${info.firstName} ${info.lastName}'),
              Text('Email: ${info.email}'),
              Text('Phone: ${info.phone ?? 'Not provided'}'),
              Text('Address: ${info.address ?? 'Not provided'}'),
              Text('Birthday: ${info.birthday?.toString() ?? 'Not provided'}'),
              const Text('Summary'),
              Text(info.summary ?? 'Not provided'),
            ],
          ],
        );
      },
    );
  }
}
