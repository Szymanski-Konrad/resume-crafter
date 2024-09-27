import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_state.dart';
part 'certificate_cubit.freezed.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit() : super(const CertificateState.initial());
}
