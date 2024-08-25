import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';

part 'basic_info_state.dart';
part 'basic_info_cubit.freezed.dart';

class BasicInfoCubit extends Cubit<BasicInfoState> {
  BasicInfoCubit(ResumeBasics? basics)
      : super(
          BasicInfoState(
            address: ValidationValue(
              value: basics?.address,
              validatorChain: LogicalOrValidatorChain([
                NullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            birthday: ValidationValue(
              value: basics?.birthday,
              validatorChain: LogicalOrValidatorChain([]),
            ),
            email: ValidationValue(
              value: basics?.email,
              validatorChain: LogicalAndValidatorChain([
                NotNullValidator(),
                EmailValidator(),
              ]),
            ),
            firstName: ValidationValue(
              value: basics?.firstName,
              validatorChain: LogicalAndValidatorChain([
                NotNullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            lastName: ValidationValue(
              value: basics?.lastName,
              validatorChain: LogicalAndValidatorChain([
                NotNullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            phone: ValidationValue(
              value: basics?.phone,
              validatorChain: LogicalOrValidatorChain([
                NullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
            summary: ValidationValue(
              value: basics?.summary,
              validatorChain: LogicalAndValidatorChain([
                NotNullValidator(),
                NotEmptyStringValidator(),
              ]),
            ),
          ),
        );

  ResumeBasics? buildBasics() {
    if (!state.isValid) {
      state.validationFields.forEach((element) {
        if (element.isNotValid) {
          print('${element.toString()} - ${element.displayError}');
        }
      });
      return null;
    }

    return ResumeBasics(
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
