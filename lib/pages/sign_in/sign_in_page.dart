import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/bloc/sign_in/sign_in_cubit.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/core/router/routes.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/pages/sign_in/sign_in_form.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocProvider<SignInCubit>(
            create: (_) => SignInCubit(locator.get<BaseAuthRepository>()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Welcome to Resume Crafter\nSign In to Continue'),
                const SignInForm(),
                const Text('Dont have an account?'),
                TextButton(
                  onPressed: () => context.goNamed(AppRoutes.signUp),
                  child: const Text('Sign Up'),
                ),
                //TODO: Causing error on web
                // if (Platform.isIOS)
                //   _CustomSignInButton(
                //     buttonType: Buttons.apple,
                //     onPressed: () {},
                //   ),
                _CustomSignInButton(
                  buttonType: Buttons.facebookNew,
                  onPressed: () {},
                ),
                _CustomSignInButton(
                  buttonType: Buttons.google,
                  onPressed: () {},
                ),
                _CustomSignInButton(
                  buttonType: Buttons.linkedIn,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomSignInButton extends StatelessWidget {
  const _CustomSignInButton({
    required this.buttonType,
    required this.onPressed,
  });

  final Buttons buttonType;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      buttonType,
      onPressed: onPressed,
      padding: buttonType == Buttons.google
          ? EdgeInsets.zero
          : const EdgeInsets.all(8.0),
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }
}
