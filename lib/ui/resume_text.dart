import 'package:flutter/material.dart';
import 'package:resume_crafter/core/style/text_styles.dart';

class ResumeText extends StatelessWidget {
  const ResumeText({
    super.key,
    required this.text,
    required this.hint,
    this.style = TextStyles.bodyBlack,
  });

  final String? text;
  final String hint;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final txt = text;
    if (txt == null) {
      return Text(
        hint,
        style: TextStyles.bodyGrey,
      );
    }
    return Text(
      txt,
      style: style,
    );
  }
}
