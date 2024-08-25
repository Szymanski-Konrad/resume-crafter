import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_section_state.dart';
part 'custom_section_cubit.freezed.dart';

class CustomSectionCubit extends Cubit<CustomSectionState> {
  CustomSectionCubit() : super(CustomSectionState.initial());
}
