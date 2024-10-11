import 'package:flutter/material.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';
import 'package:resume_crafter/utils/extensions/duration_extensions.dart';

class DateRangeText extends StatelessWidget {
  const DateRangeText({
    super.key,
    required this.startDate,
    required this.endDate,
    this.showDuration = false,
  });

  final DateTime startDate;
  final DateTime? endDate;
  final bool showDuration;

  String endDateText(BuildContext context) {
    final end = endDate;
    if (end != null) {
      return context.yearMonthFormat.format(end);
    }
    return context.l10n.present;
  }

  String _buildDuration(BuildContext context) {
    if (!showDuration) return '';
    return '(${(endDate ?? DateTime.now()).difference(startDate).toTotalExpFormat(context)})';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.yearMonthFormat.format(startDate)} - ${endDateText(context)} ${_buildDuration(context)}'
          .trim(),
      style: TextStyles.bodyGrey,
    );
  }
}
