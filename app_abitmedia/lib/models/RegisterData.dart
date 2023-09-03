import 'package:flutter/cupertino.dart';

class RegisterData {
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerSurename = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConFirmPassword =
      TextEditingController();

  void dispose() {
    // Dispose de todos los controladores y nodos de enfoque
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    controllerName.dispose();
    controllerSurename.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConFirmPassword.dispose();
  }
}
