import 'package:flutter/material.dart';
import 'package:top_up_test/locator/locate.dart';
import 'package:top_up_test/main_top_up_test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainTopUpTest());
}
