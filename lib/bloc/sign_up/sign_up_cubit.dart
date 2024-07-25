import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:resume_crafter/bloc/sign_up/sign_up_state.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/utils/form_field_types.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final BaseAuthRepository authRepository;

  SignUpCubit(this.authRepository) : super(const SignUpState());

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        errorMessage: errorMessage,
        isValid: Formz.validate(
          [
            email,
            state.password,
            state.confirmPassword,
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
        errorMessage: errorMessage,
        isValid: Formz.validate(
          [
            password,
            state.email,
            state.confirmPassword,
          ],
        ),
      ),
    );
  }

  void onConfirmPasswordChanged(String value) {
    final confirmPassword = Password.dirty(value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        errorMessage: errorMessage,
        isValid: Formz.validate(
          [
            confirmPassword,
            state.email,
            state.password,
          ],
        ),
      ),
    );
  }

  String? get errorMessage {
    final passwordError = state.password.displayError;
    final emailError = state.email.displayError;
    final confirmPasswordError = state.confirmPassword.displayError;
    return [
      if (emailError != null) emailError.text(),
      if (passwordError != null) passwordError.text(),
      if (confirmPasswordError != null) confirmPasswordError.text(),
    ].firstOrNull;
  }

  Future<void> register() async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final user = await authRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), user: null));
    }
  }
}
