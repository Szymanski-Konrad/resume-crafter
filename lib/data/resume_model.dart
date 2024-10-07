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
    String? id,
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
    String? id,
    LinkType? linkType,
    String? url,
  }) = _ResumeLink;

  factory ResumeLink.fromJson(Map<String, dynamic> json) =>
      _$ResumeLinkFromJson(json);
}

@freezed
class ResumeExperience with _$ResumeExperience {
  factory ResumeExperience({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    String? company,
    String? position,
    String? description,
  }) = _ResumeExperience;

  factory ResumeExperience.fromJson(Map<String, dynamic> json) =>
      _$ResumeExperienceFromJson(json);
}

@freezed
class ResumeEducation with _$ResumeEducation {
  factory ResumeEducation({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    String? university,
    String? degree,
    String? rating,
    String? major,
    String? specialization,
    String? description,
  }) = _ResumeEducation;

  factory ResumeEducation.fromJson(Map<String, dynamic> json) =>
      _$ResumeEducationFromJson(json);
}

@freezed
class ResumeSkill with _$ResumeSkill {
  factory ResumeSkill({
    String? id,
    String? name,
    int? level,
  }) = _ResumeSkill;

  factory ResumeSkill.fromJson(Map<String, dynamic> json) =>
      _$ResumeSkillFromJson(json);
}

@freezed
class ResumeCertificate with _$ResumeCertificate {
  factory ResumeCertificate({
    String? id,
    String? name,
    String? organization,
    DateTime? issuedAt,
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
    String? id,
    String? name,
    int? level,
  }) = _ResumeLanguage;

  factory ResumeLanguage.fromJson(Map<String, dynamic> json) =>
      _$ResumeLanguageFromJson(json);
}

@freezed
class ResumePersonalProject with _$ResumePersonalProject {
  factory ResumePersonalProject({
    String? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? website,
  }) = _ResumePersonalProject;

  factory ResumePersonalProject.fromJson(Map<String, dynamic> json) =>
      _$ResumePersonalProjectFromJson(json);
}

@freezed
class ResumePublication with _$ResumePublication {
  factory ResumePublication({
    String? id,
    String? name,
    String? description,
    DateTime? publishDate,
    String? website,
  }) = _ResumePublication;

  factory ResumePublication.fromJson(Map<String, dynamic> json) =>
      _$ResumePublicationFromJson(json);
}

@freezed
class ResumeReference with _$ResumeReference {
  factory ResumeReference({
    String? id,
    String? name,
    String? website,
    String? jobTitle,
    String? company,
    String? referenceEmail,
    String? referencePhone,
    String? description,
  }) = _ResumeReference;

  factory ResumeReference.fromJson(Map<String, dynamic> json) =>
      _$ResumeReferenceFromJson(json);
}

@freezed
class ResumeVolunteering with _$ResumeVolunteering {
  factory ResumeVolunteering({
    String? id,
    String? role,
    String? organization,
    String? description,
    String? place,
    DateTime? startDate,
    DateTime? endDate,
  }) = _ResumeVolunteering;

  factory ResumeVolunteering.fromJson(Map<String, dynamic> json) =>
      _$ResumeVolunteeringFromJson(json);
}

@freezed
class ResumeCustomSection with _$ResumeCustomSection {
  factory ResumeCustomSection({
    String? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? website,
  }) = _ResumeCustomSection;

  factory ResumeCustomSection.fromJson(Map<String, dynamic> json) =>
      _$ResumeCustomSectionFromJson(json);
}
