import 'package:resume_crafter/utils/validation/validation_value.dart';

abstract class Validator<T> {
  const Validator();

  ValidationValueError? validate(T value);
}

abstract class ValidatorChain<T> {
  const ValidatorChain(this.validators);

  final List<Validator<T?>> validators;

  bool validate(T? value);

  ValidationValueError? errorMessage(T? value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null) return error;
    }

    return null;
  }
}

class LogicalAndValidatorChain<T> extends ValidatorChain<T> {
  const LogicalAndValidatorChain(List<Validator<T>> super.validators);

  @override
  bool validate(T? value) {
    if (validators.isEmpty) return true;
    for (final validator in validators) {
      if (validator.validate(value) != null) return false;
    }
    return true;
  }
}

class LogicalOrValidatorChain<T> extends ValidatorChain<T> {
  const LogicalOrValidatorChain(List<Validator<T>> super.validators);

  @override
  bool validate(T? value) {
    if (validators.isEmpty) return true;
    for (final validator in validators) {
      if (validator.validate(value) == null) return true;
    }
    return false;
  }
}

/// Checked value should be empty
class EmptyStringValidator extends Validator<String> {
  const EmptyStringValidator();

  @override
  ValidationValueError? validate(String value) {
    if (value.isNotEmpty) return ValidationValueError.notEmpty;
    return null;
  }
}

/// Valid value should be not empty
class NotEmptyStringValidator extends Validator<String> {
  const NotEmptyStringValidator();

  @override
  ValidationValueError? validate(String value) {
    if (value.isEmpty) return ValidationValueError.empty;
    return null;
  }
}

class NullValidator<T> extends Validator<T> {
  const NullValidator();

  @override
  ValidationValueError? validate(value) {
    if (value != null) return ValidationValueError.isNotNull;
    return null;
  }
}

class NotNullValidator<T> extends Validator<T> {
  const NotNullValidator();

  @override
  ValidationValueError? validate(value) {
    if (value == null) return ValidationValueError.isNull;
    return null;
  }
}

class PasswordValidator extends Validator<String> {
  const PasswordValidator({required this.minLength});

  final int minLength;

  @override
  ValidationValueError? validate(String value) {
    if (value.length < minLength) return ValidationValueError.tooShort;
    return null;
  }
}

class EmailValidator extends Validator<String> {
  const EmailValidator();

  static final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  ValidationValueError? validate(String value) {
    if (!_emailRegExp.hasMatch(value)) return ValidationValueError.invalidEmail;
    return null;
  }
}

class UrlValidator extends Validator<String> {
  const UrlValidator();

  @override
  ValidationValueError? validate(String value) {
    final url = Uri.tryParse(value);
    if (url != null) {
      return ValidationValueError.invalidUrl;
    }
    return null;
  }
}
