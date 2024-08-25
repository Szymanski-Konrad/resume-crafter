import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_project_state.dart';
part 'personal_project_cubit.freezed.dart';

class PersonalProjectCubit extends Cubit<PersonalProjectState> {
  PersonalProjectCubit() : super(PersonalProjectState.initial());
}
