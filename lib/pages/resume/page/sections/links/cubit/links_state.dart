part of 'links_cubit.dart';

@freezed
class LinksState with _$LinksState, ValidationMixin {
  const LinksState._();

  const factory LinksState({
    ResumeLink? initialData,
    required ValidationValue<String?> url,
    required ValidationValue<LinkType?> linkType,
  }) = _LinksState;

  @override
  List<ValidationValue> get validationFields => [
        url,
        linkType,
      ];
}
