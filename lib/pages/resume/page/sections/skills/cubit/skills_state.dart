part of 'skills_cubit.dart';

@freezed
class SkillsState with _$SkillsState, ValidationMixin {
  const SkillsState._();

  const factory SkillsState({
    ResumeSkill? initialData,
    required ValidationValue<String?> name,
    required ValidationValue<int?> level,
  }) = _SkillsState;

  @override
  List<ValidationValue> get validationFields => [
        name,
        level,
      ];
}
