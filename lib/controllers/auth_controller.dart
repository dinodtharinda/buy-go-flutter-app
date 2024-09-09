// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

}