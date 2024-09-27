import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/paddings.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/data/resume_model.dart';
import 'package:resume_crafter/data/resume_section_type.dart';
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
                widget.validationValue.value?.toIso8601String() ??
                    'Wybierz datę',
              ),
              Gap.l,
              IconButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(1970, 1, 1),
                    lastDate: DateTime.now(),
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
  });

  final ResumeExperience experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(experience.company ?? ''),
        Text(experience.position ?? ''),
        Text(experience.startDate?.toIso8601String() ?? ''),
        Text(experience.endDate?.toIso8601String() ?? ''),
        Text(
          experience.description ?? '',
        )
      ],
    );
  }
}
