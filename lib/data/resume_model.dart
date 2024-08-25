import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/link_type.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required String id,
    required String userId,
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
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, dynamic> json) =>
      _$ResumeModelFromJson(json);
}

@freezed
class ResumeBasics with _$ResumeBasics {
  factory ResumeBasics({
    String? firstName,
    String? lastName,
    DateTime? birthday,
    String? address,
    String? phone,
    String? email,
    String? summary,
  }) = _ResumeBasics;

  factory ResumeBasics.fromJson(Map<String, dynamic> json) =>
      _$ResumeBasicsFromJson(json);
}

@freezed
class ResumeLink with _$ResumeLink {
  factory ResumeLink({
    required LinkType linkType,
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
    DateTime? endDate,
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
    required int level,
  }) = _ResumeSkill;

  factory ResumeSkill.fromJson(Map<String, dynamic> json) =>
      _$ResumeSkillFromJson(json);
}

@freezed
class ResumeCertificate with _$ResumeCertificate {
  factory ResumeCertificate({
    required String name,
    required String organization,
    required DateTime issuedAt,
    DateTime? expireAt,
    String? description,
    String? website,
  }) = _ResumeCertificate;

  factory ResumeCertificate.fromJson(Map<String, dynamic> json) =>
      _$ResumeCertificateFromJson(json);
}

@freezed
class ResumeLanguage with _$ResumeLanguage {
  factory ResumeLanguage({
    required String name,
    required String level,
  }) = _ResumeLanguage;

  factory ResumeLanguage.fromJson(Map<String, dynamic> json) =>
      _$ResumeLanguageFromJson(json);
}

@freezed
class ResumePersonalProject with _$ResumePersonalProject {
  factory ResumePersonalProject({
    required String name,
    required String description,
    required DateTime startDate,
    DateTime? endDate,
    String? website,
  }) = _ResumePersonalProject;

  factory ResumePersonalProject.fromJson(Map<String, dynamic> json) =>
      _$ResumePersonalProjectFromJson(json);
}

@freezed
class ResumePublication with _$ResumePublication {
  factory ResumePublication({
    required String name,
    required String description,
    required DateTime publishDate,
    String? website,
  }) = _ResumePublication;

  factory ResumePublication.fromJson(Map<String, dynamic> json) =>
      _$ResumePublicationFromJson(json);
}

@freezed
class ResumeReference with _$ResumeReference {
  factory ResumeReference({
    required String name,
    required String website,
    required String jobTitle,
    required String company,
    required String referenceEmail,
    String? referencePhone,
    required String description,
  }) = _ResumeReference;

  factory ResumeReference.fromJson(Map<String, dynamic> json) =>
      _$ResumeReferenceFromJson(json);
}

@freezed
class ResumeVolunteering with _$ResumeVolunteering {
  factory ResumeVolunteering({
    required String role,
    required String organization,
    required String description,
    required String place,
    required DateTime startDate,
    DateTime? endDate,
  }) = _ResumeVolunteering;

  factory ResumeVolunteering.fromJson(Map<String, dynamic> json) =>
      _$ResumeVolunteeringFromJson(json);
}

@freezed
class ResumeCustomSection with _$ResumeCustomSection {
  factory ResumeCustomSection({
    required String name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? website,
  }) = _ResumeCustomSection;

  factory ResumeCustomSection.fromJson(Map<String, dynamic> json) =>
      _$ResumeCustomSectionFromJson(json);
}
