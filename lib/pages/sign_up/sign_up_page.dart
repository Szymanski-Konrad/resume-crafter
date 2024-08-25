import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/bloc/sign_up/sign_up_cubit.dart';
import 'package:resume_crafter/core/locator.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/pages/sign_up/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set up your account'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocProvider<SignUpCubit>(
            create: (_) => SignUpCubit(locator.get<BaseAuthRepository>()),
            child: const Column(
              children: [
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
