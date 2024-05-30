import 'package:dashboard/data%20copy/models/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final List<MenuModel> menu = [
    MenuModel(icon: Icons.dashboard, title: 'Dashboard', route: '/dashboard'),
    MenuModel(icon: Icons.money, title: 'Transaction', route: '/transaction'),
    MenuModel(icon: Icons.task, title: 'Task', route: '/task'),
    MenuModel(icon: Icons.folder, title: 'Documents', route: '/documents'),
    MenuModel(icon: Icons.store, title: 'Store', route: '/store'),
    MenuModel(
        icon: Icons.notifications,
        title: 'Notification',
        route: '/notification'),
    MenuModel(icon: Icons.person, title: 'Profile', route: '/profile'),
    MenuModel(icon: Icons.settings, title: 'Settings', route: '/settings'),
  ];
}
