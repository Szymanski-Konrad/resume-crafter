import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
import 'package:resume_crafter/data/resume_step.dart';

part 'resume_state.freezed.dart';
part 'resume_state.g.dart';

@freezed
class ResumeState with _$ResumeState {
  factory ResumeState({
    @Default(ResumeSectionType.basicInfo) ResumeSectionType resumeSection,
    @Default(ResumeStep.name) ResumeStep resumeStep,
    @Default(false) bool isGenerating,
    String? resumeName,
    ResumeBasics? basics,
    @Default([]) List<ResumeLink> links,
    @Default([]) List<ResumeExperience> experience,
    @Default([]) List<ResumeEducation> education,
    @Default([]) List<ResumeSkill> skills,
    @Default([]) List<ResumeCertificate> certificates,
    @Default([]) List<ResumeLanguage> languages,
    @Default([]) List<ResumePersonalProject> personalProjects,
    @Default([]) List<ResumePublication> publications,
    @Default([]) List<ResumeReference> refrences,
    @Default([]) List<ResumeVolunteering> volunteering,
    @Default([]) List<ResumeCustomSection> customSections,
    @Default([]) List<ResumeSectionType> selectedSections,
  }) = _ResumeState;

  factory ResumeState.fromJson(Map<String, dynamic> json) =>
      _$ResumeStateFromJson(json);
}

extension ResumeStateExtension on ResumeState {
  String currentStepName(BuildContext context) => resumeStep.name;

  bool isSectionSelected(ResumeSectionType section) =>
      selectedSections.contains(section);

  List<ResumeSectionType> get nonSelectedSections => ResumeSectionType.values
      .where((element) => !selectedSections.contains(element))
      .toList();
}
