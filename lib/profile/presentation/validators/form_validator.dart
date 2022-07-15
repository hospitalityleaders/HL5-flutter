import 'package:form_field_validator/form_field_validator.dart';

final requiredValidator = RequiredValidator(errorText: 'The field is required');

final mustBeGreaterThanFive = LengthRangeValidator(
  min: 5,
  max: 100,
  errorText: "Must be greater then 5 characters",
);
