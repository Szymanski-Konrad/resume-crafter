part of 'experience_cubit.dart';

@freezed
class ExperienceState with _$ExperienceState {
  const factory ExperienceState({
    required ValidationValue<DateTime?> startDate,
    required ValidationValue<DateTime?> endDate,
    required ValidationValue<String?> company,
    required ValidationValue<String?> position,
    required ValidationValue<String?> description,
  }) = _ExperienceState;
}

extension ExperienceStateExtension on ExperienceState {
  List<ValidationValue> get validationFields => [
        startDate,
        endDate,
        company,
        position,
        description,
      ];

  bool get isValid => validationFields.every((element) => element.isValid);
}
