part of 'volunteering_cubit.dart';

@freezed
class VolunteeringState with _$VolunteeringState, ValidationMixin {
  const VolunteeringState._();

  const factory VolunteeringState({
    ResumeVolunteering? initialData,
    required ValidationValue<String?> role,
    required ValidationValue<String?> organization,
    required ValidationValue<DateTime?> startDate,
    required ValidationValue<DateTime?> endDate,
    required ValidationValue<String?> description,
    required ValidationValue<String?> place,
  }) = _VolunteeringState;

  @override
  List<ValidationValue> get validationFields => [
        role,
        organization,
        startDate,
        endDate,
        description,
        place,
      ];
}
