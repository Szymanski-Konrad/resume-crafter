import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/utils/form_field_types.dart';

class AuthState extends Equatable {
  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final String? errorMessage;
  final User? user;

  const AuthState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.errorMessage,
    this.user,
  });

  AuthState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, email, password, errorMessage, user];
}
