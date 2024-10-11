import 'package:flutter/material.dart';
import 'package:resume_crafter/core/constants.dart';
import 'package:resume_crafter/utils/extensions/build_context_extensions.dart';

extension DurationExtension on Duration {
  String toTotalExpFormat(BuildContext context) {
    final days = inDays;
    final years = (days / Constants.daysInYear).floor();
    final months =
        ((days - years * Constants.daysInYear) / Constants.daysInMonth).floor();
    String output = '';
    if (years > 0) {
      output += '$years ${context.l10n.yearsShort}';
    }
    if (months > 0) {
      output += ' $months ${context.l10n.monthsShort}';
    }
    return output.trim();
  }
}
