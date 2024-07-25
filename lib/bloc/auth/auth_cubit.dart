import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/bloc/auth/auth_state.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseAuthRepository authRepository;

  AuthCubit(this.authRepository) : super(const AuthState());

  Future<void> logout() async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await authRepository.signOut();
      emit(state.copyWith(status: FormzSubmissionStatus.success, user: null));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), user: null));
    }
  }

  Future<void> checkAuthentication() async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(state.copyWith(status: FormzSubmissionStatus.success, user: user));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure, user: user));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), user: null));
    }
  }
}
