import 'package:flutter/material.dart';

class Validator {

  static bool isValidEmail(String text) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return emailRegex.hasMatch(text);
  }

  static String validatePassword(String password) {
    if (password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (password.length > 20) {
      return "Password must be at most 50 characters long";
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(password)) {
      return "Password must contain at least one letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return "Password must contain at least one special character";
    }
    return 'ok';
  }
  static String validateFullName(String password) {
    if (password.isEmpty) {
      return "Full Name is required";
    }
    if (password.length < 3) {
      return "Full Name must be at least 3 characters long";
    }
    if (password.length > 50) {
      return "Full Name must be at more 50 characters long";
    }
    return 'ok';
  }

}
