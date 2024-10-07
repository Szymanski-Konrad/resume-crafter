import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'personal_project_state.dart';
part 'personal_project_cubit.freezed.dart';

class PersonalProjectCubit extends Cubit<PersonalProjectState> {
  PersonalProjectCubit(ResumePersonalProject? personalProject)
      : super(
          PersonalProjectState(
            initialData: personalProject,
            description: ValidationValue(
              value: personalProject?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            endDate: ValidationValue(
              value: personalProject?.endDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            name: ValidationValue(
              value: personalProject?.name,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            startDate: ValidationValue(
              value: personalProject?.startDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            website: ValidationValue(
              value: personalProject?.website,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumePersonalProject? buildPersonalProject() {
    if (!state.isValid) {
      return null;
    }

    return ResumePersonalProject(
      id: state.initialData?.id ?? const Uuid().v4(),
      description: state.description.value,
      endDate: state.endDate.value,
      name: state.name.value,
      startDate: state.startDate.value,
      website: state.website.value,
    );
  }
}
