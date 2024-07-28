import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required String id,
    required String userId,
    required ResumeBasics basics,
    @Default([]) List<ResumeLink> links,
    @Default([]) List<ResumeExperience> experience,
    @Default([]) List<ResumeEducation> education,
    @Default([]) List<ResumeSkill> skills,
    @Default([]) List<ResumeCertificate> certificates,
    @Default([]) List<ResumeCustomSection> customSections,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, dynamic> json) =>
      _$ResumeModelFromJson(json);
}

@freezed
class ResumeBasics with _$ResumeBasics {
  factory ResumeBasics({
    required String firstName,
    required String lastName,
    DateTime? birthday,
    String? address,
    String? phone,
    required String email,
    String? summary,
  }) = _ResumeBasics;

  factory ResumeBasics.fromJson(Map<String, dynamic> json) =>
      _$ResumeBasicsFromJson(json);
}

@freezed
class ResumeLink with _$ResumeLink {
  factory ResumeLink({
    required String url,
  }) = _ResumeLink;

  factory ResumeLink.fromJson(Map<String, dynamic> json) =>
      _$ResumeLinkFromJson(json);
}

@freezed
class ResumeExperience with _$ResumeExperience {
  factory ResumeExperience({
    required DateTime startDate,
    DateTime? endDate,
    required String company,
    required String position,
    required String description,
  }) = _ResumeExperience;

  factory ResumeExperience.fromJson(Map<String, dynamic> json) =>
      _$ResumeExperienceFromJson(json);
}

@freezed
class ResumeEducation with _$ResumeEducation {
  factory ResumeEducation({
    required DateTime startDate,
    required DateTime endDate,
    required String university,
    required String degree,
    required String title,
    required String description,
  }) = _ResumeEducation;

  factory ResumeEducation.fromJson(Map<String, dynamic> json) =>
      _$ResumeEducationFromJson(json);
}

@freezed
class ResumeSkill with _$ResumeSkill {
  factory ResumeSkill({
    required String name,
    double? level,
  }) = _ResumeSkill;

  factory ResumeSkill.fromJson(Map<String, dynamic> json) =>
      _$ResumeSkillFromJson(json);
}

@freezed
class ResumeCustomSection with _$ResumeCustomSection {
  factory ResumeCustomSection({
    required String id,
    required String title,
    required String description,
  }) = _ResumeCustomSection;

  factory ResumeCustomSection.fromJson(Map<String, dynamic> json) =>
      _$ResumeCustomSectionFromJson(json);
}

@freezed
class ResumeCertificate with _$ResumeCertificate {
  factory ResumeCertificate() = _ResumeCertificate;

  factory ResumeCertificate.fromJson(Map<String, dynamic> json) =>
      _$ResumeCertificateFromJson(json);
}
