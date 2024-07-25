import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/utils/form_field_types.dart';

class SignInState extends Equatable {
  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final String? errorMessage;
  final User? user;
  final bool isValid;

  const SignInState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.errorMessage,
    this.user,
    this.isValid = false,
  });

  SignInState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    Password? confirmPassword,
    String? errorMessage,
    User? user,
    bool? isValid,
  }) {
    return SignInState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props =>
      [status, email, password, errorMessage, user, isValid];
}
