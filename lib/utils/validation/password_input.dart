import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

enum PasswordInputError { empty, length }

extension PasswordInputErrorExtension on PasswordInputError {
  String errorMessage(BuildContext context) {
    switch (this) {
      case PasswordInputError.empty:
        return context.l10n.emptyField;
      case PasswordInputError.length:
        return context.l10n.invalidEmail;
    }
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure(String? value) : super.pure(value ?? '');

  const PasswordInput.dirty(super.value) : super.dirty();

  String? errorMessage(BuildContext context) {
    if (isValid || isPure) return null;

    return displayError?.errorMessage(context);
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;

    if (value.length < 6) return PasswordInputError.length;

    return null;
  }
}
