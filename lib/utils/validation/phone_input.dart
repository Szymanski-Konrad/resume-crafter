import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

enum PhoneInputError { empty, length }

extension PhoneInputErrorExtension on PhoneInputError {
  String errorMessage(BuildContext context) {
    switch (this) {
      case PhoneInputError.empty:
        return context.l10n.emptyField;
      case PhoneInputError.length:
        return context.l10n.invalidEmail;
    }
  }
}

class PhoneInput extends FormzInput<String, PhoneInputError> {
  const PhoneInput.pure(String? value) : super.pure(value ?? '');

  const PhoneInput.dirty(super.value) : super.dirty();

  String? errorMessage(BuildContext context) {
    if (isValid || isPure) return null;

    return displayError?.errorMessage(context);
  }

  @override
  PhoneInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PhoneInputError.empty;

    return null;
  }
}
