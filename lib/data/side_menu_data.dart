import 'package:dashboard/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.dashboard, title: 'Dashboard', route: '/dashboard'),
    MenuModel(icon: Icons.person, title: 'Transaction', route: '/transaction'),
    MenuModel(icon: Icons.settings, title: 'Task', route: '/task'),
    MenuModel(icon: Icons.logout, title: 'Documents', route: '/documents'),
    MenuModel(icon: Icons.dashboard, title: 'Store', route: '/store'),
    MenuModel(
        icon: Icons.person, title: 'Notification', route: '/notification'),
    MenuModel(icon: Icons.settings, title: 'Profile', route: '/profile'),
    MenuModel(icon: Icons.logout, title: 'Settings', route: '/settings'),
  ];

  Widget buildSideMenu(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) {
        final item = menu[index];
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            Navigator.pushNamed(context, item.route);
          },
        );
      },
    );
  }
}
