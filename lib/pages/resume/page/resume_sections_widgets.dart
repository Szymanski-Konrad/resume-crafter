import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:resume_crafter/core/constants.dart';
import 'package:resume_crafter/core/style/dimensions.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/data/resume_model_enums.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
import 'package:resume_crafter/ui/date_range_text.dart';
import 'package:resume_crafter/ui/resume_text.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';

enum SectionHeaderType { edit, addNew }

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.sectionType,
    required this.onPressed,
    this.type = SectionHeaderType.addNew,
  });

  final ResumeSectionType sectionType;
  final SectionHeaderType type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionType.name(context),
          style: TextStyles.headline3Black,
        ),
        IconButton(
          onPressed: onPressed,
          icon: _buildIcon(),
        )
      ],
    );
  }

  Icon _buildIcon() {
    switch (type) {
      case SectionHeaderType.edit:
        return const Icon(Icons.edit);
      case SectionHeaderType.addNew:
        return const Icon(Icons.add);
    }
  }
}

class SectionHint extends StatelessWidget {
  const SectionHint({
    super.key,
    required this.sectionType,
  });

  final ResumeSectionType sectionType;

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionType.hint(context),
    );
  }
}

class InfoIconText extends StatelessWidget {
  const InfoIconText({
    super.key,
    this.info,
    required this.icon,
    required this.placeholder,
  });

  final String? info;
  final String placeholder;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final text = info;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        Gap.m,
        if (text != null)
          Expanded(
            child: Text(
              text,
              style: TextStyles.bodyBlack,
            ),
          )
        else
          Text(
            placeholder,
            style: TextStyles.bodyGrey,
          ),
      ],
    );
  }
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({
    super.key,
    required this.validationValue,
    this.onUpdate,
    required this.title,
  });

  final ValidationValue<DateTime?> validationValue;
  final VoidCallback? onUpdate;
  final String title;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    final date = widget.validationValue.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.title),
        Gap.m,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: AppPaddings.sAllPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date != null
                    ? context.yearMonthFormat.format(date)
                    : context.l10n.chooseDate,
              ),
              Gap.l,
              IconButton(
                onPressed: () {
                  showMonthPicker(
                    context: context,
                    initialDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      widget.validationValue.setValue(value);
                      widget.onUpdate?.call();
                      setState(() {});
                    }
                  });
                },
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExperienceShowcase extends StatelessWidget {
  const ExperienceShowcase({
    super.key,
    required this.experience,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeExperience experience;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final startDate = experience.startDate;
    final endDate = experience.endDate ?? DateTime.now();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ResumeText(
                      text: experience.position,
                      hint: context.l10n.position,
                    ),
                    const Text(' | '),
                    ResumeText(
                      text: experience.company,
                      hint: context.l10n.company,
                    ),
                  ],
                ),
                if (startDate != null) ...[
                  DateRangeText(
                    startDate: startDate,
                    endDate: endDate,
                  ),
                  Gap.xs,
                ],
                ResumeText(
                  text: experience.description,
                  hint: context.l10n.description,
                  style: TextStyles.bodyBlack,
                )
              ],
            ),
          ),
          Gap.m,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationShowcase extends StatelessWidget {
  const EducationShowcase({
    super.key,
    required this.education,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeEducation education;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final startDate = education.startDate;
    final endDate = education.endDate ?? DateTime.now();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (startDate != null)
                  DateRangeText(startDate: startDate, endDate: endDate),
                ResumeText(
                  text: education.university,
                  hint: context.l10n.university,
                ),
                Row(
                  children: [
                    ResumeText(
                      text: education.major,
                      hint: context.l10n.major,
                    ),
                    const Text(' | '),
                    ResumeText(
                      text: education.degree,
                      hint: context.l10n.degree,
                    ),
                    const Text(' | '),
                    ResumeText(
                      text: education.rating,
                      hint: context.l10n.rating,
                    ),
                  ],
                ),
                ResumeText(
                  text: education.specialization,
                  hint: context.l10n.specialization,
                ),
                ResumeText(
                  text: education.description,
                  hint: context.l10n.description,
                ),
              ],
            ),
          ),
          Gap.m,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LinkShowcase extends StatelessWidget {
  const LinkShowcase({
    super.key,
    required this.link,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeLink link;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final url = link.url;
    return Row(
      children: [
        if (url != null)
          LinkifyText(url)
        else
          Text(
            context.l10n.website,
            style: TextStyles.bodyGrey,
          ),
        Gap.m,
        IconButton(
          onPressed: onEditTap,
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: onRemoveTap,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}

class SkillShowcase extends StatelessWidget {
  const SkillShowcase({
    super.key,
    required this.skill,
    required this.onRemoveTap,
    required this.onEditTap,
  });

  final ResumeSkill skill;
  final VoidCallback onRemoveTap;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    final level = skill.level;
    return Chip(
      label: Row(
        children: [
          Expanded(
            child: ResumeText(
              text: skill.name,
              hint: context.l10n.name,
            ),
          ),
          if (level != null && level > 0) ...[
            Gap.s,
            Expanded(
              child: LinearProgressIndicator(
                value: level / Constants.maxSkillLevel,
              ),
            ),
          ],
          Gap.s,
          IconButton(
            onPressed: onEditTap,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      deleteIcon: const Icon(Icons.delete),
      onDeleted: onRemoveTap,
    );
  }
}

class LanguageShowcase extends StatelessWidget {
  const LanguageShowcase({
    super.key,
    required this.language,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeLanguage language;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final level = language.level;
    return Chip(
      onDeleted: onEditTap,
      label: Row(
        children: [
          Expanded(
            child: ResumeText(
              text: language.name,
              hint: context.l10n.name,
            ),
          ),
          if (level != null) ...[
            Gap.s,
            Expanded(
              child: LinearProgressIndicator(value: level.levelProgress),
            ),
          ],
        ],
      ),
    );
  }
}

class CertificateShowcase extends StatelessWidget {
  const CertificateShowcase({
    super.key,
    required this.certificate,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeCertificate certificate;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final issuedAt = certificate.issuedAt;
    final expiredAt = certificate.expireAt;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ResumeText(text: certificate.name, hint: context.l10n.name),
                ResumeText(
                    text: certificate.organization,
                    hint: context.l10n.organization),
                ResumeText(
                    text: certificate.website, hint: context.l10n.website),
                if (issuedAt != null)
                  Text(
                    '${context.l10n.issuedAt}: ${context.yearMonthFormat.format(issuedAt)}',
                  ),
                if (expiredAt != null)
                  Text(
                    '${context.l10n.expireAt}: ${context.yearMonthFormat.format(expiredAt)}',
                  ),
              ],
            ),
          ),
          Gap.m,
          IconButton(
            onPressed: onEditTap,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

class PersonalProjectShowcase extends StatelessWidget {
  const PersonalProjectShowcase({
    super.key,
    required this.personalProject,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumePersonalProject personalProject;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final endDate = personalProject.endDate;
    final startDate = personalProject.startDate;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ResumeText(
                  text: personalProject.name,
                  hint: context.l10n.name,
                ),
                if (startDate != null)
                  Text(context.yearMonthFormat.format(startDate)),
                if (endDate != null)
                  Text(context.yearMonthFormat.format(endDate)),
                ResumeText(
                  text: personalProject.website,
                  hint: context.l10n.website,
                ),
                ResumeText(
                  text: personalProject.description,
                  hint: context.l10n.description,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PublicationShowcase extends StatelessWidget {
  const PublicationShowcase({
    super.key,
    required this.publication,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumePublication publication;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final publishDate = publication.publishDate;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ResumeText(
                  text: publication.name,
                  hint: context.l10n.name,
                ),
                if (publishDate != null)
                  Text(context.yearMonthFormat.format(publishDate)),
                ResumeText(
                  text: publication.website,
                  hint: context.l10n.website,
                ),
                ResumeText(
                  text: publication.description,
                  hint: context.l10n.description,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReferenceShowcase extends StatelessWidget {
  const ReferenceShowcase({
    super.key,
    required this.reference,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeReference reference;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ResumeText(
                  text: reference.name,
                  hint: context.l10n.name,
                ),
                ResumeText(
                  text: reference.company,
                  hint: context.l10n.company,
                ),
                ResumeText(
                  text: reference.jobTitle,
                  hint: context.l10n.jobTitle,
                ),
                ResumeText(
                  text: reference.referencePhone,
                  hint: context.l10n.referencePhone,
                ),
                ResumeText(
                  text: reference.referenceEmail,
                  hint: context.l10n.referenceEmail,
                ),
                ResumeText(
                  text: reference.description,
                  hint: context.l10n.description,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VolunteeringShowcase extends StatelessWidget {
  const VolunteeringShowcase({
    super.key,
    required this.volunteering,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeVolunteering volunteering;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final endDate = volunteering.endDate;
    final startDate = volunteering.startDate;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ResumeText(
                  text: volunteering.description,
                  hint: context.l10n.description,
                ),
                ResumeText(
                  text: volunteering.organization,
                  hint: context.l10n.organization,
                ),
                ResumeText(
                  text: volunteering.place,
                  hint: context.l10n.place,
                ),
                ResumeText(
                  text: volunteering.role,
                  hint: 'Role',
                ),
                ResumeText(
                  text: volunteering.description,
                  hint: context.l10n.description,
                ),
                if (startDate != null)
                  Text(context.yearMonthFormat.format(startDate)),
                if (endDate != null)
                  Text(context.yearMonthFormat.format(endDate)),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomSectionShowcase extends StatelessWidget {
  const CustomSectionShowcase({
    super.key,
    required this.customSection,
    required this.onEditTap,
    required this.onRemoveTap,
  });

  final ResumeCustomSection customSection;
  final VoidCallback onEditTap;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final endDate = customSection.endDate;
    final startDate = customSection.startDate;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(AppDimens.m),
      ),
      padding: AppPaddings.mAllPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ResumeText(
                  text: customSection.name,
                  hint: context.l10n.name,
                ),
                ResumeText(
                  text: customSection.website,
                  hint: context.l10n.website,
                ),
                if (startDate != null)
                  Text(context.yearMonthFormat.format(startDate)),
                if (endDate != null)
                  Text(context.yearMonthFormat.format(endDate)),
                ResumeText(
                  text: customSection.description,
                  hint: context.l10n.description,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
