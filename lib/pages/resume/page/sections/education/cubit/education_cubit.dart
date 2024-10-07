import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'education_state.dart';
part 'education_cubit.freezed.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit(ResumeEducation? education)
      : super(
          EducationState(
            initialData: education,
            startDate: ValidationValue(
              value: education?.startDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            endDate: ValidationValue(
              value: education?.endDate,
              validatorChain: const LogicalOrValidatorChain([]),
            ),
            degree: ValidationValue(
              value: education?.degree,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            description: ValidationValue(
              value: education?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            major: ValidationValue(
              value: education?.major,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            rating: ValidationValue(
              value: education?.rating,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            specialization: ValidationValue(
              value: education?.specialization,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            university: ValidationValue(
              value: education?.university,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeEducation? buildEducation() {
    if (!state.isValid) {
      return null;
    }

    return ResumeEducation(
      id: state.initialData?.id ?? const Uuid().v4(),
      startDate: state.startDate.value,
      endDate: state.endDate.value,
      degree: state.degree.value,
      description: state.description.value,
      major: state.major.value,
      rating: state.rating.value,
      specialization: state.specialization.value,
      university: state.university.value,
    );
  }
}
