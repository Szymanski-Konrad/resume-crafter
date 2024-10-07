import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'volunteering_state.dart';
part 'volunteering_cubit.freezed.dart';

class VolunteeringCubit extends Cubit<VolunteeringState> {
  VolunteeringCubit(ResumeVolunteering? volunteering)
      : super(
          VolunteeringState(
            initialData: volunteering,
            description: ValidationValue(
              value: volunteering?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            endDate: ValidationValue(
              value: volunteering?.endDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            organization: ValidationValue(
              value: volunteering?.organization,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            place: ValidationValue(
              value: volunteering?.place,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            role: ValidationValue(
              value: volunteering?.role,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            startDate: ValidationValue(
              value: volunteering?.startDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeVolunteering? buildVolunteering() {
    if (!state.isValid) {
      return null;
    }

    return ResumeVolunteering(
      id: state.initialData?.id ?? const Uuid().v4(),
      description: state.description.value,
      endDate: state.endDate.value,
      organization: state.organization.value,
      place: state.place.value,
      role: state.role.value,
      startDate: state.startDate.value,
    );
  }
}
