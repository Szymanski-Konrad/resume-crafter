part of 'custom_section_cubit.dart';

@freezed
class CustomSectionState with _$CustomSectionState, ValidationMixin {
  const CustomSectionState._();

  const factory CustomSectionState({
    ResumeCustomSection? initialData,
    required ValidationValue<String?> name,
    required ValidationValue<String?> description,
    required ValidationValue<String?> website,
    required ValidationValue<DateTime?> startDate,
    required ValidationValue<DateTime?> endDate,
  }) = _CustomSectionState;

  @override
  List<ValidationValue> get validationFields => [
        name,
        description,
        website,
        startDate,
        endDate,
      ];
}
