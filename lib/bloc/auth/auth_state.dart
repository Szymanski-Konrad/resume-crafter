import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  inProgress,
  unknown,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final String? errorMessage;
  final User? user;

  const AuthState({
    this.authStatus = AuthStatus.unknown,
    this.errorMessage,
    this.user,
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [authStatus, errorMessage, user];
}
