import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteering_state.dart';
part 'volunteering_cubit.freezed.dart';

class VolunteeringCubit extends Cubit<VolunteeringState> {
  VolunteeringCubit() : super(const VolunteeringState.initial());
}
