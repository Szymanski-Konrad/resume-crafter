part of 'basic_info_cubit.dart';

@freezed
class BasicInfoState with _$BasicInfoState, ValidationMixin {
  const BasicInfoState._();

  const factory BasicInfoState({
    ResumeBasics? initialData,
    required ValidationValue<String?> firstName,
    required ValidationValue<String?> lastName,
    required ValidationValue<DateTime?> birthday,
    required ValidationValue<String?> address,
    required ValidationValue<String?> phone,
    required ValidationValue<String?> email,
    required ValidationValue<String?> summary,
  }) = _BasicInfoState;

  @override
  List<ValidationValue> get validationFields => [
        firstName,
        lastName,
        birthday,
        address,
        phone,
        email,
        summary,
      ];
}
