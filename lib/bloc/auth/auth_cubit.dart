import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/bloc/auth/auth_state.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseAuthRepository authRepository;

  AuthCubit({
    required this.authRepository,
  }) : super(const AuthState());

  Future<void> logout() async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.inProgress));
      await authRepository.signOut();
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated, user: null));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), user: null));
    }
  }

  Future<void> checkAuthentication() async {
    try {
      emit(const AuthState());
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(state.copyWith(
          authStatus: AuthStatus.authenticated,
          user: user,
        ));
      } else {
        emit(state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          user: user,
        ));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), user: null));
    }
  }
}
