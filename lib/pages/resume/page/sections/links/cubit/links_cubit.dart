import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/link_type.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'links_state.dart';
part 'links_cubit.freezed.dart';

class LinksCubit extends Cubit<LinksState> {
  LinksCubit(ResumeLink? link)
      : super(
          LinksState(
            initialData: link,
            linkType: ValidationValue(
              value: link?.linkType ?? LinkType.website,
              validatorChain:
                  const LogicalOrValidatorChain([NotNullValidator()]),
            ),
            url: ValidationValue(
              value: link?.url,
              validatorChain: const LogicalAndValidatorChain(
                [
                  NotNullValidator(),
                  UrlValidator(),
                ],
              ),
            ),
          ),
        );

  ResumeLink? buildLink() {
    if (!state.isValid) {
      return null;
    }

    return ResumeLink(
      id: state.initialData?.id ?? const Uuid().v4(),
      linkType: state.linkType.value,
      url: state.url.value,
    );
  }
}
