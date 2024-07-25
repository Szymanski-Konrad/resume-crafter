import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/bloc/sign_in/sign_in_state.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/utils/form_field_types.dart';

class SignInCubit extends Cubit<SignInState> {
  final BaseAuthRepository authRepository;

  SignInCubit(this.authRepository) : super(const SignInState());

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            email,
            state.password,
          ],
        ),
      ),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [
            password,
            state.email,
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await authRepository.signIn(
        email: state.email.value,
        password: state.password.value,
      );
      final user = await authRepository.getCurrentUser();
      emit(state.copyWith(status: FormzSubmissionStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), user: null));
    }
  }
}
