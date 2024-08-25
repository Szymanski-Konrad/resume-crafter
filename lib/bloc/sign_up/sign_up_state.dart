import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/utils/form_field_types.dart';

class SignUpState extends Equatable {
  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final Password confirmPassword;
  final String? errorMessage;
  final User? user;
  final bool isValid;

  const SignUpState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.errorMessage,
    this.user,
    this.isValid = false,
  });

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    Password? confirmPassword,
    String? errorMessage,
    User? user,
    bool? isValid,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        confirmPassword,
        errorMessage,
        user,
        isValid,
      ];
}
