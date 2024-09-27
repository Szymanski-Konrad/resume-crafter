import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/basic_info/cubit/basic_info_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';

class BasicInfoPage extends StatelessWidget {
  const BasicInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicInfoCubit, BasicInfoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.basicInfo),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  ValidatedTextField(
                    validationValue: state.firstName,
                    label: context.l10n.firstName,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.lastName,
                    label: context.l10n.lastName,
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.address,
                    label: context.l10n.address,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.email,
                    label: context.l10n.email,
                    errorMessage:
                        state.email.displayError?.errorMessage(context),
                    isRequired: true,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.phone,
                    errorMessage:
                        state.phone.displayError?.errorMessage(context),
                    label: context.l10n.phone,
                  ),
                  Gap.m,
                  ValidatedTextField(
                    validationValue: state.summary,
                    label: context.l10n.summary,
                    isRequired: true,
                    minLines: 5,
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final basics =
                          context.read<BasicInfoCubit>().buildBasics();
                      if (basics == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Error while saving basics')));
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context.read<ResumeCubit>().updateBasics(basics);
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
