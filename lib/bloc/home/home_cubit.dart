import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/bloc/home/home_state.dart';
import 'package:resume_crafter/repositories/auth/base_auth_repository.dart';
import 'package:resume_crafter/repositories/auth/resume/base_resume_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.authRepository,
    required this.resumeRepository,
  }) : super(HomeState());

  final BaseAuthRepository authRepository;
  final BaseResumeRepository resumeRepository;

  Future<void> init() async {}

  Future<void> loadResumeMetadata() async {
    final user = await authRepository.getCurrentUser();
    if (user == null) {
      debugPrint('User is null, cannot load resume metadata');
      return;
    }
    final userId = user.$id;

    final resumes = await resumeRepository.getUserAllResumeMetadata(
      userId: userId,
    );

    emit(state.copyWith(resumesMetadata: resumes));
  }
}
