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

  void updateExperience(ResumeExperience experience) {
    final list = List.of(state.experience);
    final index = list.indexWhere((element) => element.id == experience.id);
    if (index == -1) {
      list.add(experience);
    } else {
      list[index] = experience;
    }
    list.sort((a, b) {
      final aStartDate = a.startDate;
      final bStartDate = b.startDate;
      if (aStartDate == null && bStartDate == null) {
        return 0;
      } else if (aStartDate == null) {
        return -1;
      } else if (bStartDate == null) {
        return 1;
      } else {
        return aStartDate.compareTo(bStartDate);
      }
    });
    emit(state.copyWith(experience: list));
  }
}
