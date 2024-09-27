import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_state.dart';
part 'education_cubit.freezed.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(const EducationState.initial());
}
