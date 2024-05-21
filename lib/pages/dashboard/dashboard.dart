import 'package:dashboard/pages/dashboard/widget/dashboard_widget.dart';
import 'package:dashboard/widgets/side_menu_widget.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: backgroundSecondaryColor,
                child: SideMenuWidget(),
              ),
            ),
            Expanded(
              flex: 7,
              child: DashboardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
