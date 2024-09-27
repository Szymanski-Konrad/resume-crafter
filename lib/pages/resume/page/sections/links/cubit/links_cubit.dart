import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'links_state.dart';
part 'links_cubit.freezed.dart';

class LinksCubit extends Cubit<LinksState> {
  LinksCubit() : super(const LinksState.initial());
}
