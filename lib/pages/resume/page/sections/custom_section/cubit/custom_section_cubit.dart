import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'custom_section_state.dart';
part 'custom_section_cubit.freezed.dart';

class CustomSectionCubit extends Cubit<CustomSectionState> {
  CustomSectionCubit(ResumeCustomSection? customSection)
      : super(
          CustomSectionState(
            initialData: customSection,
            description: ValidationValue(
              value: customSection?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            endDate: ValidationValue(
              value: customSection?.endDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            name: ValidationValue(
              value: customSection?.name,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            startDate: ValidationValue(
              value: customSection?.startDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            website: ValidationValue(
              value: customSection?.website,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeCustomSection? buildCustomSection() {
    if (!state.isValid) {
      return null;
    }

    return ResumeCustomSection(
      id: state.initialData?.id ?? const Uuid().v4(),
      description: state.description.value,
      endDate: state.endDate.value,
      name: state.name.value,
      startDate: state.startDate.value,
      website: state.website.value,
    );
  }
}
