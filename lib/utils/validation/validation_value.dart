import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';
import 'package:resume_crafter/utils/validation/validators.dart';

enum ValidationValueError {
  isNull,
  isNotNull,
  empty,
  notEmpty,
  tooShort,
  tooLong,
  invalidEmail,
  invalidUrl,
}

extension ValidationValueErrorExtension on ValidationValueError {
  //TODO: Add localization string here
  String errorMessage(BuildContext context) {
    switch (this) {
      case ValidationValueError.empty:
        return context.l10n.emptyField;
      case ValidationValueError.tooShort:
        return 'Too short value';
      case ValidationValueError.tooLong:
        return 'Too long value';
      case ValidationValueError.notEmpty:
        return 'Not empty value';
      case ValidationValueError.isNull:
        return 'Value is null';
      case ValidationValueError.invalidEmail:
        return 'Invalid email';
      case ValidationValueError.isNotNull:
        return 'Value is not null';
      case ValidationValueError.invalidUrl:
        return 'Invalid url';
    }
  }
}

class ValidationValue<T> extends Equatable {
  ValidationValue({
    required this.value,
    required this.validatorChain,
  });

  T value;

  final ValidatorChain<T> validatorChain;

  bool isPure = true;

  bool get isValid => validatorChain.validate(value);

  void setValue(T newValue) {
    isPure = false;
    value = newValue;
  }

  bool get isNotValid => !isValid;

  ValidationValueError? get error {
    return validatorChain.validate(value)
        ? null
        : validatorChain.errorMessage(value);
  }

  ValidationValueError? get displayError => isPure ? null : error;

  @override
  List<Object?> get props => [
        value,
        isPure,
        validatorChain,
      ];
}
