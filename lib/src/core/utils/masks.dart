import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masks {
  Masks._();

  static final phoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
}

extension MaskExtension on MaskTextInputFormatter {
  String unMaskText(String input) => unmaskText(input);
  int unMaskInt(String input) => int.parse(unmaskText(input));
  num unMaskDoublet(String input) => double.parse(unmaskText(input));
}
