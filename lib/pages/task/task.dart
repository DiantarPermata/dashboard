import 'package:dashboard/pages/task/widget/task_widget.dart';
import 'package:dashboard/widgets/side_menu_widget.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: backgroundSecondaryColor,
                child: SideMenuWidget(),
              ),
            ),
            Expanded(
              flex: 7,
              child: TaskWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
