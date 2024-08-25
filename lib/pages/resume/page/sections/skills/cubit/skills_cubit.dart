import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_state.dart';
part 'skills_cubit.freezed.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit() : super(SkillsState.initial());
}
