import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  DateFormat get yearMonthFormat => DateFormat(
        DateFormat.YEAR_NUM_MONTH,
        l10n.localeName,
      );
}
