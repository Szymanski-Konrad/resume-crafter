import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_crafter/data/link_type.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/data/resume_model_enums.dart';
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

  void removeExperience(ResumeExperience experience) {
    final list = List.of(state.experience);
    list.removeWhere((element) => element.id == experience.id);
    emit(state.copyWith(experience: list));
  }

  void removeEducation(ResumeEducation education) {
    final list = List.of(state.education);
    list.removeWhere((element) => element.id == education.id);
    emit(state.copyWith(education: list));
  }

  void removeLink(ResumeLink link) {
    final list = List.of(state.links);
    list.removeWhere((element) => element.id == link.id);
    emit(state.copyWith(links: list));
  }

  void removeSkill(ResumeSkill skill) {
    final list = List.of(state.skills);
    list.removeWhere((element) => element.id == skill.id);
    emit(state.copyWith(skills: list));
  }

  void removeCertificate(ResumeCertificate certificate) {
    final list = List.of(state.certificates);
    list.removeWhere((element) => element.id == certificate.id);
    emit(state.copyWith(certificates: list));
  }

  void removeLanguage(ResumeLanguage language) {
    final list = List.of(state.languages);
    list.removeWhere((element) => element.id == language.id);
    emit(state.copyWith(languages: list));
  }

  void removePersonalProject(ResumePersonalProject personalProject) {
    final list = List.of(state.personalProjects);
    list.removeWhere((element) => element.id == personalProject.id);
    emit(state.copyWith(personalProjects: list));
  }

  void removePublication(ResumePublication publication) {
    final list = List.of(state.publications);
    list.removeWhere((element) => element.id == publication.id);
    emit(state.copyWith(publications: list));
  }

  void removeReference(ResumeReference reference) {
    final list = List.of(state.references);
    list.removeWhere((element) => element.id == reference.id);
    emit(state.copyWith(references: list));
  }

  void removeVolunteering(ResumeVolunteering volunteering) {
    final list = List.of(state.volunteering);
    list.removeWhere((element) => element.id == volunteering.id);
    emit(state.copyWith(volunteering: list));
  }

  void removeCustomSection(ResumeCustomSection customSection) {
    final list = List.of(state.customSections);
    list.removeWhere((element) => element.id == customSection.id);
    emit(state.copyWith(customSections: list));
  }

  void generateTemporaryResumeInState() {
    emit(
      state.copyWith(
        volunteering: [
          ResumeVolunteering(
            id: '1',
            description: 'volunteering',
            endDate: DateTime.now(),
            organization: 'UNICEF',
            place: 'London',
            role: 'Ticket man',
            startDate: DateTime.now().subtract(const Duration(days: 5)),
          ),
        ],
        references: [
          ResumeReference(
            id: '2',
            name: 'Newest reference',
            company: 'AppTailors',
            jobTitle: 'Flutter Developer',
            referenceEmail: 'a@.com',
            referencePhone: '123 456 789',
            website: 'www.example.com',
            description: 'nice working, solid',
          ),
        ],
        publications: [
          ResumePublication(
            id: '3',
            name: 'Best publication',
            description: 'time to resolve some unresolved math',
            website: 'www.no-worries.com',
            publishDate: DateTime(2023, 10, 25),
          )
        ],
        basics: ResumeBasics(
          id: '4',
          firstName: 'Peter',
          lastName: 'Hohland',
          address: 'Greenwitch 24/7',
          birthday: DateTime.now(),
          email: 'resume.crafter@gmail.com',
          phone: '123 456 789',
          summary:
              'Szukający pierwszych wyzwań zawodowych w dynamicznym środowisku. Posiadam solidną wiedzę teoretyczną z zakresu [przedmioty studiów] oraz umiejętności pracy zespołowej i szybkiego uczenia się. Chętny do zdobywania nowych doświadczeń i rozwoju zawodowego.',
        ),
        certificates: [
          ResumeCertificate(
            id: '5',
            name: 'Certyfikat',
            description: 'Dostałem nowy certyfikat',
            expireAt: DateTime.now(),
            issuedAt: DateTime(2024, 1, 5),
            organization: 'UNICEF',
            website: 'https://unicef.com',
          ),
        ],
        education: [
          ResumeEducation(
            id: '6',
            degree: 'inżynier',
            description: 'Ciekawe studia',
            endDate: DateTime(2023, 05, 11),
            startDate: DateTime(2020, 9, 15),
            major: 'Informatyka',
            rating: '4.5',
            specialization: 'Informatyka stosowana',
            university: 'Politechnia Białostocka',
          ),
        ],
        experience: [
          ResumeExperience(
            id: '7',
            company: 'AppTailors',
            description: 'Ciekawa praca',
            endDate: DateTime.now(),
            startDate: DateTime(2020, 1, 1),
            position: 'Flutter Developer',
          ),
        ],
        isGenerating: false,
        languages: [
          ResumeLanguage(
              name: 'angielski', level: ResumeLanguageLevel.b2, id: '8'),
          ResumeLanguage(
              name: 'polski', level: ResumeLanguageLevel.native, id: '9'),
        ],
        links: [
          ResumeLink(
              linkType: LinkType.github, url: 'https://github.com', id: '10'),
          ResumeLink(
              linkType: LinkType.linkedIn,
              url: 'https://linkedin.com',
              id: '11'),
        ],
        skills: [
          ResumeSkill(name: 'BLoC', level: 3, id: '12'),
          ResumeSkill(name: 'Appwrite', level: 2, id: '13'),
          ResumeSkill(name: 'Flutter', level: 5, id: '14'),
          ResumeSkill(name: 'Dart', id: '15'),
          ResumeSkill(name: 'Firebase', level: 0, id: '16'),
        ],
        resumeName: 'Testowe CV',
        selectedSections: ResumeSectionType.values,
        personalProjects: [
          ResumePersonalProject(
            id: '17',
            name: 'Shop together',
            description:
                'Lista do współdzielenia listy zakupów w czasie rzeczywistym',
            startDate: DateTime(2021, 5, 29),
            endDate: DateTime.now(),
            website: 'https://shop-together.dev',
          ),
          ResumePersonalProject(
            id: '18',
            name: 'Smart car',
            description: 'Nadzorowanie pracy samochodu',
            startDate: DateTime(2023, 5, 29),
            endDate: DateTime(2024, 3, 19),
            website: 'https://smart-car.dev',
          ),
        ],
      ),
    );
  }
}
