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
    if (selectedSections.contains(section) &&
        section != ResumeSectionType.customSection) {
      selectedSections.remove(section);
    } else {
      selectedSections.add(section);
    }
    selectedSections.sort((a, b) => a.index.compareTo(b.index));
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

  void updateEducation(ResumeEducation education) {
    final list = List.of(state.education);
    final index = list.indexWhere((element) => element.id == education.id);
    if (index == -1) {
      list.add(education);
    } else {
      list[index] = education;
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
    emit(state.copyWith(education: list));
  }

  void updateLink(ResumeLink link) {
    final list = List.of(state.links);
    final index = list.indexWhere((element) => element.id == link.id);
    if (index == -1) {
      list.add(link);
    } else {
      list[index] = link;
    }
    emit(state.copyWith(links: list));
  }

  void updateSkill(ResumeSkill skill) {
    final list = List.of(state.skills);
    final index = list.indexWhere((element) => element.id == skill.id);
    if (index == -1) {
      list.add(skill);
    } else {
      list[index] = skill;
    }
    emit(state.copyWith(skills: list));
  }

  void updateCertificate(ResumeCertificate certificate) {
    final list = List.of(state.certificates);
    final index = list.indexWhere((element) => element.id == certificate.id);
    if (index == -1) {
      list.add(certificate);
    } else {
      list[index] = certificate;
    }
    emit(state.copyWith(certificates: list));
  }

  void updateLanguage(ResumeLanguage language) {
    final list = List.of(state.languages);
    final index = list.indexWhere((element) => element.id == language.id);
    if (index == -1) {
      list.add(language);
    } else {
      list[index] = language;
    }
    emit(state.copyWith(languages: list));
  }

  void updatePersonalProject(ResumePersonalProject project) {
    final list = List.of(state.personalProjects);
    final index = list.indexWhere((element) => element.id == project.id);
    if (index == -1) {
      list.add(project);
    } else {
      list[index] = project;
    }
    emit(state.copyWith(personalProjects: list));
  }

  void updatePublications(ResumePublication publication) {
    final list = List.of(state.publications);
    final index = list.indexWhere((element) => element.id == publication.id);
    if (index == -1) {
      list.add(publication);
    } else {
      list[index] = publication;
    }
    emit(state.copyWith(publications: list));
  }

  void updateReference(ResumeReference reference) {
    final list = List.of(state.references);
    final index = list.indexWhere((element) => element.id == reference.id);
    if (index == -1) {
      list.add(reference);
    } else {
      list[index] = reference;
    }
    emit(state.copyWith(references: list));
  }

  void updateVolunteering(ResumeVolunteering volunteering) {
    final list = List.of(state.volunteering);
    final index = list.indexWhere((element) => element.id == volunteering.id);
    if (index == -1) {
      list.add(volunteering);
    } else {
      list[index] = volunteering;
    }
    emit(state.copyWith(volunteering: list));
  }

  void updateCustomSection(ResumeCustomSection customSection) {
    final list = List.of(state.customSections);
    final index = list.indexWhere((element) => element.id == customSection.id);
    if (index == -1) {
      list.add(customSection);
    } else {
      list[index] = customSection;
    }
    emit(state.copyWith(customSections: list));
  }
}
