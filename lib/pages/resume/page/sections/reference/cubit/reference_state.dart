part of 'reference_cubit.dart';

@freezed
class ReferenceState with _$ReferenceState, ValidationMixin {
  const ReferenceState._();

  const factory ReferenceState({
    ResumeReference? initialData,
    required ValidationValue<String?> name,
    required ValidationValue<String?> website,
    required ValidationValue<String?> jobTitle,
    required ValidationValue<String?> company,
    required ValidationValue<String?> referenceEmail,
    required ValidationValue<String?> referencePhone,
    required ValidationValue<String?> description,
  }) = _ReferenceState;

  @override
  List<ValidationValue> get validationFields => [
        name,
        website,
        jobTitle,
        company,
        referenceEmail,
        referencePhone,
        description,
      ];
}
