import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/widgets/header_widget.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Column(
        children: [
          const SizedBox(height: 18),
          HeaderWidget(),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
