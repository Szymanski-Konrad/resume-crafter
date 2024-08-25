import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

enum UsernameInputError { empty, length }

extension UsernameInputErrorExtension on UsernameInputError {
  String errorMessage(BuildContext context) {
    switch (this) {
      case UsernameInputError.empty:
        return context.l10n.emptyField;
      case UsernameInputError.length:
        return context.l10n.invalidEmail;
    }
  }
}

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure(String? value) : super.pure(value ?? '');

  const UsernameInput.dirty(super.value) : super.dirty();

  String? errorMessage(BuildContext context) {
    if (isValid || isPure) return null;

    return displayError?.errorMessage(context);
  }

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameInputError.empty;

    if (value.length < 3) return UsernameInputError.length;

    return null;
  }
}
