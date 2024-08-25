import 'package:flutter/material.dart';
import 'package:resume_crafter/core/style/gaps.dart';
import 'package:resume_crafter/core/style/text_styles.dart';
import 'package:resume_crafter/utils/validation/validation_value.dart';

class ValidatedTextField extends StatefulWidget {
  const ValidatedTextField({
    super.key,
    this.initialText,
    this.errorMessage,
    this.obscureText = false,
    this.label,
    this.hint,
    this.onChanged,
    this.validator,
    this.minLines,
    this.isRequired = false,
    required this.validationValue,
  });

  final String? initialText;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final String? errorMessage;
  final bool obscureText;
  final String? label;
  final String? hint;
  final ValidationValue<String?> validationValue;
  final int? minLines;
  final bool isRequired;

  @override
  State<ValidatedTextField> createState() => _ValidatedTextFieldState();
}

class _ValidatedTextFieldState extends State<ValidatedTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText ?? widget.validationValue.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyles.bodyBlack,
              ),
              if (widget.isRequired) ...[
                Gap.xs,
                Text(
                  '*',
                  style: TextStyles.bodyBlack.copyWith(
                    color: Colors.red,
                  ),
                )
              ],
            ],
          ),
          Gap.s,
          buildTextField(context),
        ],
      );
    }
    return buildTextField(context);
  }

  Widget buildTextField(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        widget.validationValue.setValue(value);
        widget.onChanged?.call(value);
      },
      validator: widget.validator,
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      maxLines: widget.minLines,
      decoration: InputDecoration(
        hintText: widget.hint,
        errorText: widget.errorMessage,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
