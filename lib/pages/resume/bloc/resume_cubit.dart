import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
import 'package:resume_crafter/data/resume_step.dart';
import 'package:resume_crafter/pages/resume/bloc/resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  //TODO: Remove parameter in state
  ResumeCubit() : super(ResumeState(resumeStep: ResumeStep.sections));

  void onSubmitName(String name) {
    emit(state.copyWith(resumeName: name));
  }

  void changeStep(ResumeStep step) {
    emit(state.copyWith(resumeStep: step));
  }

  void changeSection(ResumeSectionType section) {
    emit(state.copyWith(resumeSection: section));
  }

  void moveToSections() {
    emit(state.copyWith(
      resumeStep: ResumeStep.sections,
      resumeSection: state.selectedSections.first,
    ));
  }

  void toggleSectionSelection(ResumeSectionType section) {
    final selectedSections =
        List<ResumeSectionType>.from(state.selectedSections);
    if (selectedSections.contains(section)) {
      selectedSections.remove(section);
    } else {
      selectedSections.add(section);
    }
    emit(state.copyWith(selectedSections: selectedSections));
  }

  void updateBasics(ResumeBasics basics) {
    debugPrint('Updating basics');
    debugPrint(basics.toString());
    emit(state.copyWith(basics: basics));
  }
}
