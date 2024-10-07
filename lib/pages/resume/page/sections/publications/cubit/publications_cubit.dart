import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'publications_state.dart';
part 'publications_cubit.freezed.dart';

class PublicationsCubit extends Cubit<PublicationsState> {
  PublicationsCubit(ResumePublication? publication)
      : super(
          PublicationsState(
            initialData: publication,
            publishDate: ValidationValue(
              value: publication?.publishDate,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            name: ValidationValue(
              value: publication?.name,
              validatorChain: const LogicalOrValidatorChain([]),
            ),
            website: ValidationValue(
              value: publication?.website,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            description: ValidationValue(
              value: publication?.description,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumePublication? buildPublication() {
    if (!state.isValid) {
      return null;
    }

    return ResumePublication(
      id: state.initialData?.id ?? const Uuid().v4(),
      name: state.name.value,
      publishDate: state.publishDate.value,
      website: state.website.value,
      description: state.description.value,
    );
  }
}
