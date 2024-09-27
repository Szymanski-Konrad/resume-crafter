import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference_state.dart';
part 'reference_cubit.freezed.dart';

class ReferenceCubit extends Cubit<ReferenceState> {
  ReferenceCubit() : super(const ReferenceState.initial());
}
