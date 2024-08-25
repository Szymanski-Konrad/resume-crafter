import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';

part 'experience_state.dart';
part 'experience_cubit.freezed.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit(ResumeExperience? experience)
      : super(
          ExperienceState(
            startDate: ValidationValue(
              value: experience?.startDate,
              validatorChain: LogicalOrValidatorChain([]),
            ),
            endDate: ValidationValue(
              value: experience?.endDate,
              validatorChain: LogicalOrValidatorChain([]),
            ),
            company: ValidationValue(
              value: experience?.company,
              validatorChain: LogicalOrValidatorChain([]),
            ),
            description: ValidationValue(
              value: experience?.description,
              validatorChain: LogicalOrValidatorChain([]),
            ),
            position: ValidationValue(
              value: experience?.position,
              validatorChain: LogicalOrValidatorChain([]),
            ),
          ),
        );
}
