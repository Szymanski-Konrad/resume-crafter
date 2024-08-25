part of 'basic_info_cubit.dart';

@freezed
class BasicInfoState with _$BasicInfoState {
  const factory BasicInfoState({
    required ValidationValue<String?> firstName,
    required ValidationValue<String?> lastName,
    required ValidationValue<DateTime?> birthday,
    required ValidationValue<String?> address,
    required ValidationValue<String?> phone,
    required ValidationValue<String?> email,
    required ValidationValue<String?> summary,
  }) = _BasicInfoState;
}

extension BasicInfoStateExtension on BasicInfoState {
  List<ValidationValue> get validationFields => [
        firstName,
        lastName,
        birthday,
        address,
        phone,
        email,
        summary,
      ];

  bool get isValid => validationFields.every((element) => element.isValid);
}
