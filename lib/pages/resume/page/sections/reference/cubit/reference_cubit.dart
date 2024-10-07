import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'reference_state.dart';
part 'reference_cubit.freezed.dart';

class ReferenceCubit extends Cubit<ReferenceState> {
  ReferenceCubit(ResumeReference? reference)
      : super(
          ReferenceState(
            initialData: reference,
            company: ValidationValue(
              value: reference?.company,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            description: ValidationValue(
              value: reference?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            jobTitle: ValidationValue(
              value: reference?.jobTitle,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            name: ValidationValue(
              value: reference?.name,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            referenceEmail: ValidationValue(
              value: reference?.referenceEmail,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            referencePhone: ValidationValue(
              value: reference?.referencePhone,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            website: ValidationValue(
              value: reference?.website,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeReference? buildReference() {
    if (!state.isValid) {
      return null;
    }

    return ResumeReference(
      id: state.initialData?.id ?? const Uuid().v4(),
      company: state.company.value,
      description: state.description.value,
      jobTitle: state.jobTitle.value,
      name: state.name.value,
      referenceEmail: state.referenceEmail.value,
      referencePhone: state.referencePhone.value,
      website: state.website.value,
    );
  }
}
