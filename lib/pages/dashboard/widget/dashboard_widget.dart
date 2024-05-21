import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/pages/dashboard/widget/header_widget_dashboard.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Column(
        children: [
          const SizedBox(height: 18),
          HeaderWidgetDashboard(),
        ],
      ),
    );
  }
}
