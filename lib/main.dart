import 'package:flutter/material.dart';
import 'package:to_do_list/src/app.dart';
import 'package:to_do_list/src/data/db/db_connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDb();

  runApp(const App());
}