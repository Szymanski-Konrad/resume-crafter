import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_metadata.freezed.dart';
part 'resume_metadata.g.dart';

@freezed
class ResumeMetadata with _$ResumeMetadata {
  factory ResumeMetadata({
    required String id,
    required String name,
    required String userId,
    required String resumeId,
    required DateTime createdAt,
    DateTime? modifiedAt,
  }) = _ResumeMetadata;

  factory ResumeMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResumeMetadataFromJson(json);
}

abstract class ResumeMetadataFields {
  static String id = 'id';
  static String name = 'name';
  static String userId = 'userId';
  static String resumeId = 'resumeId';
  static String createdAt = 'createdAt';
  static String modifiedAt = 'modifiedAt';
}
