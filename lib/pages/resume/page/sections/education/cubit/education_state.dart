part of 'education_cubit.dart';

@freezed
class EducationState with _$EducationState, ValidationMixin {
  const factory EducationState({
    ResumeEducation? initialData,
    required ValidationValue<DateTime?> startDate,
    required ValidationValue<DateTime?> endDate,
    required ValidationValue<String?> university,
    required ValidationValue<String?> degree,
    required ValidationValue<String?> rating,
    required ValidationValue<String?> major,
    required ValidationValue<String?> specialization,
    required ValidationValue<String?> description,
  }) = _EducationState;

  const EducationState._();

  @override
  List<ValidationValue> get validationFields => [
        startDate,
        endDate,
        university,
        degree,
        rating,
        major,
        specialization,
        description,
      ];
}
