import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_metadata.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default([]) List<ResumeMetadata> resumesMetadata,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
