import 'package:flutter/material.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/data/resume_section_type.dart';

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
    final _info = info;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        Gap.m,
        if (_info != null)
          Expanded(
            child: Text(
              _info,
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
