import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/resume_sections_widgets.dart';
import 'package:resume_crafter/pages/resume/page/sections/certificates/cubit/certificate_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class CertificatesPage extends StatelessWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificateCubit, CertificateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.certificates),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  ValidatedTextField(
                    validationValue: state.description,
                    label: context.l10n.description,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.name,
                    label: context.l10n.name,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.organization,
                    label: context.l10n.organization,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.website,
                    label: context.l10n.website,
                    isRequired: true,
                  ),
                  Gap.m,
                  Row(
                    children: [
                      Expanded(
                        child: DateTimePicker(
                          title: context.l10n.issuedAt,
                          validationValue: state.issuedAt,
                          onUpdate: () {
                            state.issuedAt.isValid;
                          },
                        ),
                      ),
                      Gap.l,
                      Expanded(
                        child: DateTimePicker(
                          title: context.l10n.expireAt,
                          validationValue: state.expireAt,
                          onUpdate: () {
                            state.expireAt.isValid;
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final certificate =
                          context.read<CertificateCubit>().buildCertificate();
                      if (certificate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Error while saving certificate')));
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context
                          .read<ResumeCubit>()
                          .updateCertificate(certificate);
                      context.pop();
                    },
                    child: const Text('Save changes'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
