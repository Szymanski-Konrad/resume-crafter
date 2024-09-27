import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_state.dart';
part 'skills_cubit.freezed.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit() : super(const SkillsState.initial());
}
