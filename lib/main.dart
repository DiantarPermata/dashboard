import 'package:Dashboard/pages/dashboard/dashboard.dart';
import 'package:Dashboard/pages/documents/documents.dart';
import 'package:Dashboard/pages/notif/notif.dart';
import 'package:Dashboard/pages/pagescreen.dart';
import 'package:Dashboard/pages/profile/profile.dart';
import 'package:Dashboard/pages/settings/settings.dart';
import 'package:Dashboard/pages/store/store.dart';
import 'package:Dashboard/pages/task/task.dart';
import 'package:Dashboard/pages/transaction/transaction.dart';
import 'package:Dashboard/theme/color.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: background,
        useMaterial3: true,
      ),
      home: PageScreen(),
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/transaction': (context) => Transaction(),
        '/task': (context) => Task(),
        '/documents': (context) => Documents(),
        '/store': (context) => Store(),
        '/notification': (context) => Notif(),
        '/profile': (context) => Profile(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
