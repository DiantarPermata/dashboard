import 'package:dashboard/theme/color.dart';
import 'package:dashboard/widgets/add_body.dart';
import 'package:dashboard/widgets/detail_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/widgets/header_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Column(
        children: [
          const SizedBox(height: 18),
          HeaderWidget(),
          const SizedBox(height: 18),
          AddBodyWidget(),
          const SizedBox(height: 18),
          DetailCardWidget(),
        ],
      ),
    );
  }
}
