  String? validateLoginInputs(String email, String password) {
    if (email.isEmpty || !email.contains('@')) {
      return 'Invalid email address';
    }

    if (password.isEmpty || password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    // Validation passed
    return null;
  }