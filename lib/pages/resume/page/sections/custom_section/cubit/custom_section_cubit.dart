import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_section_state.dart';
part 'custom_section_cubit.freezed.dart';

class CustomSectionCubit extends Cubit<CustomSectionState> {
  CustomSectionCubit() : super(const CustomSectionState.initial());
}
