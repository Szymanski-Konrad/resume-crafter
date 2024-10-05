import 'package:resume_crafter/core/constants.dart';

extension DurationExtension on Duration {
  String toTotalExpFormat() {
    final days = inDays;
    final years = (days / Constants.daysInYear).floor();
    final months =
        ((days - years * Constants.daysInYear) / Constants.daysInMonth).floor();
    String output = '';
    if (years > 0) {
      output += '$years y';
    }
    if (months > 0) {
      output += ' $months m';
    }
    return output.trim();
  }
}
