import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard/provider/user_provider.dart';
import 'package:dashboard/pages/dashboard/dashboard.dart';
import 'package:dashboard/pages/profile/profile.dart';
import 'package:dashboard/pages/settings/settings.dart';
import 'package:dashboard/pages/documents/documents.dart';
import 'package:dashboard/pages/notif/notif.dart';
import 'package:dashboard/pages/store/store.dart';
import 'package:dashboard/pages/task/task.dart';
import 'package:dashboard/pages/transaction/transaction.dart';

class PageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.user == null) {
          // ignore: body_might_complete_normally_catch_error
          userProvider.fetchUser().catchError((error) {
            // Handle error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error fetching user data: $error')),
            );
          });
          return Center(child: CircularProgressIndicator());
        }

        final user = userProvider.user!;
        final permissions = user.permissions;

        return Scaffold(
          body: Navigator(
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return MaterialPageRoute(builder: (context) => Dashboard());
                case '/dashboard':
                  return MaterialPageRoute(builder: (context) => Dashboard());
                case '/transaction':
                  return permissions.contains('transaction')
                      ? MaterialPageRoute(builder: (context) => Transaction())
                      : MaterialPageRoute(builder: (context) => Dashboard());
                case '/task':
                  return permissions.contains('task')
                      ? MaterialPageRoute(builder: (context) => Task())
                      : MaterialPageRoute(builder: (context) => Dashboard());
                case '/documents':
                  return permissions.contains('documents')
                      ? MaterialPageRoute(builder: (context) => Documents())
                      : MaterialPageRoute(builder: (context) => Dashboard());
                case '/store':
                  return permissions.contains('store')
                      ? MaterialPageRoute(builder: (context) => Store())
                      : MaterialPageRoute(builder: (context) => Dashboard());
                case '/notification':
                  return permissions.contains('notification')
                      ? MaterialPageRoute(builder: (context) => Notif())
                      : MaterialPageRoute(builder: (context) => Dashboard());
                case '/profile':
                  return MaterialPageRoute(builder: (context) => Profile());
                case '/settings':
                  return MaterialPageRoute(builder: (context) => Settings());
                default:
                  return MaterialPageRoute(builder: (context) => Dashboard());
              }
            },
          ),
        );
      },
    );
  }

  List<Widget> buildMenuItems(BuildContext context, List<String> permissions) {
    final menuItems = [
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text('Dashboard'),
        onTap: () => Navigator.pushNamed(context, '/dashboard'),
      ),
      if (permissions.contains('transaction'))
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Transaction'),
          onTap: () => Navigator.pushNamed(context, '/transaction'),
        ),
      if (permissions.contains('task'))
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Task'),
          onTap: () => Navigator.pushNamed(context, '/task'),
        ),
      if (permissions.contains('documents'))
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Documents'),
          onTap: () => Navigator.pushNamed(context, '/documents'),
        ),
      if (permissions.contains('store'))
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text('Store'),
          onTap: () => Navigator.pushNamed(context, '/store'),
        ),
      if (permissions.contains('notification'))
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Notification'),
          onTap: () => Navigator.pushNamed(context, '/notification'),
        ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Profile'),
        onTap: () => Navigator.pushNamed(context, '/profile'),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Settings'),
        onTap: () => Navigator.pushNamed(context, '/settings'),
      ),
    ];
    return menuItems;
  }
}
