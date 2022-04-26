import 'package:custom_file_manager/presentation/file_manager_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FileManagerApp());
}

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Manager Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FileManagerPage(),
    );
  }
}
