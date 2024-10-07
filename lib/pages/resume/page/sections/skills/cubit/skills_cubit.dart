import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'skills_state.dart';
part 'skills_cubit.freezed.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit(ResumeSkill? skill)
      : super(
          SkillsState(
            initialData: skill,
            level: ValidationValue(
              value: skill?.level,
              validatorChain: const LogicalOrValidatorChain([]),
            ),
            name: ValidationValue(
              value: skill?.name,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeSkill? buildSkill() {
    if (!state.isValid) {
      return null;
    }

    return ResumeSkill(
      id: state.initialData?.id ?? const Uuid().v4(),
      level: state.level.value,
      name: state.name.value,
    );
  }
}
