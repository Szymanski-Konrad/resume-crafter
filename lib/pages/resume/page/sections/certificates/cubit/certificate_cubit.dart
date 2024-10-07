import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'certificate_state.dart';
part 'certificate_cubit.freezed.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit(ResumeCertificate? certificate)
      : super(
          CertificateState(
            initialData: certificate,
            description: ValidationValue(
              value: certificate?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            expireAt: ValidationValue(
              value: certificate?.expireAt,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            issuedAt: ValidationValue(
              value: certificate?.issuedAt,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            name: ValidationValue(
              value: certificate?.name,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            organization: ValidationValue(
              value: certificate?.organization,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            website: ValidationValue(
              value: certificate?.website,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeCertificate? buildCertificate() {
    if (!state.isValid) {
      return null;
    }

    return ResumeCertificate(
      id: state.initialData?.id ?? const Uuid().v4(),
      description: state.description.value,
      expireAt: state.expireAt.value,
      issuedAt: state.issuedAt.value,
      name: state.name.value,
      organization: state.organization.value,
      website: state.website.value,
    );
  }
}
