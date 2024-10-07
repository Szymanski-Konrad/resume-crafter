part of 'certificate_cubit.dart';

@freezed
class CertificateState with _$CertificateState, ValidationMixin {
  const CertificateState._();

  const factory CertificateState({
    ResumeCertificate? initialData,
    required ValidationValue<String?> name,
    required ValidationValue<String?> organization,
    required ValidationValue<DateTime?> issuedAt,
    required ValidationValue<DateTime?> expireAt,
    required ValidationValue<String?> description,
    required ValidationValue<String?> website,
  }) = _CertificateState;

  @override
  List<ValidationValue> get validationFields => [
        name,
        organization,
        issuedAt,
        expireAt,
        description,
        website,
      ];
}
