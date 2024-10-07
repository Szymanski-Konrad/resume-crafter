import 'package:resume_crafter/utils/validation/validation_value.dart';

mixin ValidationMixin {
  List<ValidationValue> get validationFields;

  bool get isValid => validationFields.every((element) => element.isValid);
}
