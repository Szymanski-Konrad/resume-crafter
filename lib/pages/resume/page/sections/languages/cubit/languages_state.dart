part of 'languages_cubit.dart';

@freezed
class LanguagesState with _$LanguagesState, ValidationMixin {
  const LanguagesState._();

  const factory LanguagesState({
    ResumeLanguage? initialData,
    required ValidationValue<String?> name,
    required ValidationValue<int?> level,
  }) = _LanguagesState;

  @override
  List<ValidationValue> get validationFields => [
        name,
        level,
      ];
}
