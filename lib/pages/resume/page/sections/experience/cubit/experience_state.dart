part of 'experience_cubit.dart';

@freezed
class ExperienceState with _$ExperienceState, ValidationMixin {
  const ExperienceState._();

  const factory ExperienceState({
    ResumeExperience? initialData,
    required ValidationValue<DateTime?> startDate,
    required ValidationValue<DateTime?> endDate,
    required ValidationValue<String?> company,
    required ValidationValue<String?> position,
    required ValidationValue<String?> description,
  }) = _ExperienceState;

  @override
  List<ValidationValue> get validationFields => [
        startDate,
        endDate,
        company,
        position,
        description,
      ];
}
