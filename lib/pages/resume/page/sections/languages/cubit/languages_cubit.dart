import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/utils/validation/validation_mixin.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';
import 'package:resume_crafter/utils/validation/validators.dart';
import 'package:uuid/uuid.dart';

part 'languages_state.dart';
part 'languages_cubit.freezed.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit(ResumeLanguage? language)
      : super(
          LanguagesState(
            initialData: language,
            level: ValidationValue(
              value: language?.level,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
            name: ValidationValue(
              value: language?.name,
              validatorChain: const LogicalOrValidatorChain([
                NotNullValidator(),
              ]),
            ),
          ),
        );

  ResumeLanguage? buildLanguage() {
    if (!state.isValid) {
      return null;
    }

    return ResumeLanguage(
      id: state.initialData?.id ?? const Uuid().v4(),
      level: state.level.value,
      name: state.name.value,
    );
  }
}
