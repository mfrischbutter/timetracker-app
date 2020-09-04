class Validate {
  /*
   * Returns an error message if required field is empty.
   */
  static String requiredField(String value, String message) {
    if (value.trim().isEmpty) {
      return message;
    }
    return null;
  }

}
