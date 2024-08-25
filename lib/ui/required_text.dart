import 'package:flutter/material.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/text_styles.dart';

class RequiredText extends StatelessWidget {
  const RequiredText({
    super.key,
    required this.text,
    this.isRequired = false,
  });

  final String text;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return Row(
        children: [
          Text(
            text,
            style: TextStyles.bodyBlack,
          ),
          Gap.xs,
          Text(
            '*',
            style: TextStyles.bodyBlack.copyWith(color: Colors.red),
          ),
        ],
      );
    }
    return Text(text);
  }
}
