part of 'personal_project_cubit.dart';

@freezed
class PersonalProjectState with _$PersonalProjectState, ValidationMixin {
  const PersonalProjectState._();

  const factory PersonalProjectState({
    ResumePersonalProject? initialData,
    required ValidationValue<String?> name,
    required ValidationValue<String?> description,
    required ValidationValue<String?> website,
    required ValidationValue<DateTime?> startDate,
    required ValidationValue<DateTime?> endDate,
  }) = _PersonalProjectState;

  @override
  List<ValidationValue> get validationFields => [
        name,
        description,
        website,
        startDate,
        endDate,
      ];
}
