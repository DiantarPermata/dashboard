import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';

class NoAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor,
      appBar: AppBar(
        backgroundColor: textColor,
      ),
      body: Center(
        child: Text(
          'Kamu tidak memiliki Akses untuk membuka page ini!',
          style: TextStyle(fontSize: 20, color: background),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
