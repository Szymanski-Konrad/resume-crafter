import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:resume_crafter/core/style/dimensions.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';
import 'package:resume_crafter/utils/extensions/duration_extensions.dart';
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
          style: TextStyles.headline1Black,
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
                    ? DateFormat(
                            DateFormat.YEAR_ABBR_MONTH, context.l10n.localeName)
                        .format(date)
                    : 'Wybierz datę',
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
  });

  final ResumeExperience experience;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    final startDate = experience.startDate;
    final endDate = experience.endDate ?? DateTime.now();
    final dateFormat = DateFormat(
      DateFormat.YEAR_NUM_MONTH,
      context.l10n.localeName,
    );
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
                Text(
                  '${experience.position ?? ''} | ${experience.company ?? ''}',
                  style: TextStyles.bodyBlack,
                ),
                if (startDate != null)
                  Text(
                    '${dateFormat.format(startDate)} - ${dateFormat.format(endDate)} (${endDate.difference(startDate).toTotalExpFormat()})',
                    style: TextStyles.bodyGrey,
                  ),
                Text(
                  experience.description ?? 'no description',
                  style: TextStyles.bodyBlack,
                )
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

class EducationShowcase extends StatelessWidget {
  const EducationShowcase({
    super.key,
    required this.education,
    required this.onEditTap,
  });

  final ResumeEducation education;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    final startDate = education.startDate;
    final endDate = education.endDate ?? DateTime.now();
    final dateFormat = DateFormat(
      DateFormat.YEAR_NUM_MONTH,
      context.l10n.localeName,
    );
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
                  Text(
                    '${dateFormat.format(startDate)} - ${dateFormat.format(endDate)} (${endDate.difference(startDate).toTotalExpFormat()})',
                    style: TextStyles.bodyGrey,
                  ),
                Text(education.university ?? 'university'),
                Text(
                    '${education.major} | ${education.degree} | ${education.rating}'),
                Text(education.specialization ?? ''),
                Text(education.description ?? ''),
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

class LinksShowcase extends StatelessWidget {
  const LinksShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
