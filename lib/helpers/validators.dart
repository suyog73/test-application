import 'package:form_field_validator/form_field_validator.dart';

var emojiRegexp = RegExp(
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

MultiValidator myValidator({required String requiredField}) {
  return MultiValidator(
      [RequiredValidator(errorText: '$requiredField is required')]);
}

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'Enter a valid email address')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
  //     errorText: 'passwords must have at least one special character')
]);
