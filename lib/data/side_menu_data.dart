import 'package:dashboard/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.dashboard, title: 'Dashboard'),
    MenuModel(icon: Icons.person, title: 'Transaction'),
    MenuModel(icon: Icons.settings, title: 'Task'),
    MenuModel(icon: Icons.logout, title: 'Documents'),
    MenuModel(icon: Icons.dashboard, title: 'Store'),
    MenuModel(icon: Icons.person, title: 'Notification'),
    MenuModel(icon: Icons.settings, title: 'Profile'),
    MenuModel(icon: Icons.logout, title: 'Settings'),
  ];
}
