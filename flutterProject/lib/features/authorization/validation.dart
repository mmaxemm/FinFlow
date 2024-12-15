String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  }
  final emailRegex = RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$');
  if (!emailRegex.hasMatch(value)) {
    return 'Invalid email address';
  }
  return null;
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  }
  final usernameRegex = RegExp('(?=.{8,20}\$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])');
  if (!usernameRegex.hasMatch(value)) {
    return 'Invalid username';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}