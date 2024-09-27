import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'basic_info_state.dart';
part 'basic_info_cubit.freezed.dart';

class BasicInfoCubit extends Cubit<BasicInfoState> {
  BasicInfoCubit(ResumeBasics? basics)
      : super(
          BasicInfoState(
            address: ValidationValue(
              value: basics?.address,
              validatorChain: const LogicalOrValidatorChain([
                NullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            birthday: ValidationValue(
              value: basics?.birthday,
              validatorChain: const LogicalOrValidatorChain([]),
            ),
            email: ValidationValue(
              value: basics?.email,
              validatorChain: const LogicalAndValidatorChain([
                NotNullValidator(),
                EmailValidator(),
              ]),
            ),
            firstName: ValidationValue(
              value: basics?.firstName,
              validatorChain: const LogicalAndValidatorChain([
                NotNullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            lastName: ValidationValue(
              value: basics?.lastName,
              validatorChain: const LogicalAndValidatorChain([
                NotNullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            phone: ValidationValue(
              value: basics?.phone,
              validatorChain: const LogicalOrValidatorChain([
                NullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            summary: ValidationValue(
              value: basics?.summary,
              validatorChain: const LogicalAndValidatorChain([
                NotNullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
          ),
        );

  ResumeBasics? buildBasics() {
    if (!state.isValid) {
      return null;
    }

    return ResumeBasics(
      id: state.initialData?.id ?? const Uuid().v4(),
      firstName: state.firstName.value,
      lastName: state.lastName.value,
      email: state.email.value,
      address: state.address.value,
      birthday: state.birthday.value,
      phone: state.phone.value,
      summary: state.summary.value,
    );
  }
}
