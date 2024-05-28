import 'package:dashboard/pages/error/not_acces.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/pages/dashboard/dashboard.dart';
import 'package:dashboard/pages/documents/documents.dart';
import 'package:dashboard/pages/notif/notif.dart';
import 'package:dashboard/pages/profile/profile.dart';
import 'package:dashboard/pages/settings/settings.dart';
import 'package:dashboard/pages/store/store.dart';
import 'package:dashboard/pages/task/task.dart';
import 'package:dashboard/pages/transaction/transaction.dart';

var dashboardHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Dashboard();
  },
);

var transactionHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Transaction();
  },
);

var taskHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Task();
  },
);

var documentsHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Documents();
  },
);

var storeHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Store();
  },
);

var notificationHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Notif();
  },
);

var profileHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Profile();
  },
);

var settingsHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Settings();
  },
);

var noAccessHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return NoAccess();
  },
);
