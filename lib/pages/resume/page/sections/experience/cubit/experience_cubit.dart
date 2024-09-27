import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'experience_state.dart';
part 'experience_cubit.freezed.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit(ResumeExperience? experience)
      : super(
          ExperienceState(
            startDate: ValidationValue(
              value: experience?.startDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            endDate: ValidationValue(
              value: experience?.endDate,
              validatorChain: const LogicalOrValidatorChain([]),
            ),
            company: ValidationValue(
              value: experience?.company,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            description: ValidationValue(
              value: experience?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            position: ValidationValue(
              value: experience?.position,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeExperience? buildExperience() {
    if (!state.isValid) {
      return null;
    }

    return ResumeExperience(
      id: state.initialData?.id ?? const Uuid().v4(),
      startDate: state.startDate.value,
      company: state.company.value,
      position: state.position.value,
      description: state.description.value,
      endDate: state.endDate.value,
    );
  }
}
