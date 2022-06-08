extension EmailValidator on String {
  bool getEmailValidation() {
    return RegExp(
            r'^[a-zA-Z0-9]+[\.\-\_]*[a-zA-Z0-9]*[@][a-zA-Z]{3,7}[\.][a-zA-Z]{2,3}$')
        .hasMatch(this);
  }
}
