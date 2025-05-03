import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './application.dart';
import './core/constants/providers.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const Application()));
}
