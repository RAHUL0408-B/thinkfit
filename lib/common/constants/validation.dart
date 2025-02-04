String? validateField(String? value){
  if(value == null || value.isEmpty){
    return "Please Enter this Field.";
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Please Enter Email";
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return "Please Enter a valid Email Address";
  }
  return null;
}

String? validatePassword(String? password) {
  List<String> errors = [];
  if (password == null || password.isEmpty) {
    return "Please Enter Password";
  }
  if (password.length < 8) {
    errors.add("*.Password must be at least 8 characters long.");
  }
  if (!RegExp(r"[A-Z]").hasMatch(password)) {
    errors.add("*.Password must contain at least one uppercase letter.");
  }
  if (!RegExp(r"[a-z]").hasMatch(password)) {
    errors.add("*.Password must contain at least one lowercase letter.");
  }
  if (!RegExp(r"[0-9]").hasMatch(password)) {
    errors.add("*.Password must contain at least one number.");
  }
  // If there are any errors, join them with newlines and return as a single string
  if (errors.isNotEmpty) {
    return errors.join("\n");
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }

  // Basic regex to validate a phone number with 7 to 15 digits
  String pattern = r'^[0-9]{7,15}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter a valid phone number';
  }

  return null;
}