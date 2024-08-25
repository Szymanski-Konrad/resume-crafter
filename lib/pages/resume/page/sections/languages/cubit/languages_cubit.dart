import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages_state.dart';
part 'languages_cubit.freezed.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit() : super(LanguagesState.initial());
}
