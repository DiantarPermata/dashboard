import 'package:flutter/material.dart';
import 'package:dashboard/model/menu_model.dart';

class SideMenuData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.dashboard, title: 'Dashboard', route: '/dashboard'),
    MenuModel(icon: Icons.person, title: 'Transaction', route: '/transaction'),
    MenuModel(icon: Icons.settings, title: 'Task', route: '/task'),
    MenuModel(icon: Icons.logout, title: 'Documents', route: '/documents'),
    MenuModel(icon: Icons.store, title: 'Store', route: '/store'),
    MenuModel(
        icon: Icons.notifications,
        title: 'Notification',
        route: '/notification'),
    MenuModel(icon: Icons.person, title: 'Profile', route: '/profile'),
    MenuModel(icon: Icons.settings, title: 'Settings', route: '/settings'),
  ];
}
