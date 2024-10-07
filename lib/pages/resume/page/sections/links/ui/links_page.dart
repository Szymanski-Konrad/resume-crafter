import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_cubit.dart';
import 'package:resume_crafter/pages/resume/page/sections/links/cubit/links_cubit.dart';
import 'package:resume_crafter/ui/text_fields.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinksCubit, LinksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.links),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.lAllPadding,
              child: Column(
                children: [
                  //TODO: Add link icon selection
                  Gap.l,
                  ValidatedTextField(
                    validationValue: state.url,
                    label: context.l10n.links,
                    isRequired: true,
                  ),
                  Gap.l,
                  ElevatedButton(
                    onPressed: () {
                      final link = context.read<LinksCubit>().buildLink();
                      if (link == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error while saving link'),
                          ),
                        );
                        //TODO: Show info that something goes wrong
                        return;
                      }
                      context.read<ResumeCubit>().updateLink(link);
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
