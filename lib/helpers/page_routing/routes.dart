import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handlers.dart';

class Routes {
  static String home = "/";
  static String dashboard = "/dashboard";
  static String transaction = "/transaction";
  static String task = "/task";
  static String documents = "/documents";
  static String store = "/store";
  static String notification = "/notification";
  static String profile = "/profile";
  static String settings = "/settings";
  static String noAccess = "/no-access"; // Define the No Access route

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        return Scaffold(body: Center(child: Text('Page not found')));
      },
    );

    router.define(home, handler: dashboardHandler);
    router.define(dashboard, handler: dashboardHandler);
    router.define(transaction, handler: transactionHandler);
    router.define(task, handler: taskHandler);
    router.define(documents, handler: documentsHandler);
    router.define(store, handler: storeHandler);
    router.define(notification, handler: notificationHandler);
    router.define(profile, handler: profileHandler);
    router.define(settings, handler: settingsHandler);
    router.define(noAccess, handler: noAccessHandler); // Add No Access handler
  }
}
