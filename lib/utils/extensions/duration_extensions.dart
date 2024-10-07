import 'package:resume_crafter/core/constants.dart';

extension DurationExtension on Duration {
  String toTotalExpFormat() {
    //TODO: Use localization
    final days = inDays;
    final years = (days / Constants.daysInYear).floor();
    final months =
        ((days - years * Constants.daysInYear) / Constants.daysInMonth).floor();
    String output = '';
    if (years > 0) {
      output += '$years lat';
    }
    if (months > 0) {
      output += ' $months mies';
    }
    return output.trim();
  }
}
