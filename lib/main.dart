import 'package:contact_auth_bloc/src/app.dart';
import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.injection();
  runApp(const App());
}
