part of 'publications_cubit.dart';

@freezed
class PublicationsState with _$PublicationsState, ValidationMixin {
  const PublicationsState._();

  const factory PublicationsState({
    ResumePublication? initialData,
    required ValidationValue<DateTime?> publishDate,
    required ValidationValue<String?> name,
    required ValidationValue<String?> description,
    required ValidationValue<String?> website,
  }) = _PublicationsState;

  @override
  List<ValidationValue> get validationFields => [
        publishDate,
        name,
        description,
        website,
      ];
}
