import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  const app = App();
  await dotenv.load(fileName: ".env");
  runApp(app);
}
