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
  String errorMessage(BuildContext context) {
    switch (this) {
      case ValidationValueError.empty:
        return context.l10n.emptyField;
      case ValidationValueError.tooShort:
        return context.l10n.tooShortValue;
      case ValidationValueError.tooLong:
        return context.l10n.tooLongValue;
      case ValidationValueError.notEmpty:
        return context.l10n.notEmptyValue;
      case ValidationValueError.isNull:
        return context.l10n.valueIsNull;
      case ValidationValueError.invalidEmail:
        return context.l10n.invalidEmail;
      case ValidationValueError.isNotNull:
        return context.l10n.isNotNull;
      case ValidationValueError.invalidUrl:
        return context.l10n.invalidUrl;
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
