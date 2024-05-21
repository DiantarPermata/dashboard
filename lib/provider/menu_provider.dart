import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  String _currentRoute = '/dashboard';

  int get selectedIndex => _selectedIndex;
  String get currentRoute => _currentRoute;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        _currentRoute = '/dashboard';
        break;
      case 1:
        _currentRoute = '/transaction';
        break;
      case 2:
        _currentRoute = '/task';
        break;
      case 3:
        _currentRoute = '/documents';
        break;
      case 4:
        _currentRoute = '/store';
        break;
      case 5:
        _currentRoute = '/notification';
        break;
      case 6:
        _currentRoute = '/profile';
        break;
      case 7:
        _currentRoute = '/settings';
        break;
    }
    notifyListeners();
  }
}
