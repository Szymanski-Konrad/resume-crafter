import 'package:flutter/material.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

enum ResumeSectionType {
  basicInfo,
  experience,
  education,
  links,
  skills,
  certificates,
  languages,
  personalProjects,
  publications,
  refrences,
  volunteering,
  customSection,
}

extension ResumeSectionExtension on ResumeSectionType {
  String name(BuildContext context) {
    switch (this) {
      case ResumeSectionType.basicInfo:
        return context.l10n.basicInfo;
      case ResumeSectionType.experience:
        return context.l10n.experience;
      case ResumeSectionType.education:
        return context.l10n.education;
      case ResumeSectionType.links:
        return context.l10n.links;
      case ResumeSectionType.skills:
        return context.l10n.skills;
      case ResumeSectionType.certificates:
        return context.l10n.certificates;
      case ResumeSectionType.languages:
        return context.l10n.languages;
      case ResumeSectionType.personalProjects:
        return context.l10n.personalProjects;
      case ResumeSectionType.publications:
        return context.l10n.publications;
      case ResumeSectionType.refrences:
        return context.l10n.references;
      case ResumeSectionType.volunteering:
        return context.l10n.volunteering;
      case ResumeSectionType.customSection:
        return context.l10n.customSection;
    }
  }

  String hint(BuildContext context) {
    switch (this) {
      case ResumeSectionType.basicInfo:
        return context.l10n.basicInfoHint;
      case ResumeSectionType.experience:
        return context.l10n.experienceHint;
      case ResumeSectionType.education:
        return context.l10n.educationHint;
      case ResumeSectionType.links:
        return context.l10n.linksHint;
      case ResumeSectionType.skills:
        return context.l10n.skillsHint;
      case ResumeSectionType.certificates:
        return context.l10n.certificatesHint;
      case ResumeSectionType.languages:
        return context.l10n.languagesHint;
      case ResumeSectionType.personalProjects:
        return context.l10n.personalProjectsHint;
      case ResumeSectionType.publications:
        return context.l10n.publicationsHint;
      case ResumeSectionType.refrences:
        return context.l10n.referencesHint;
      case ResumeSectionType.volunteering:
        return context.l10n.volunteeringHint;
      case ResumeSectionType.customSection:
        return context.l10n.customSectionHint;
    }
  }
}
