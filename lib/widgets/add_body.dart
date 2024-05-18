import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';

class AddBodyWidget extends StatefulWidget {
  @override
  _AddBodyWidgetState createState() => _AddBodyWidgetState();
}

class _AddBodyWidgetState extends State<AddBodyWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 30),
          Expanded(
            child: Text(
              "My Files",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          GestureDetector(
            onTapDown: (_) {
              setState(() {
                _isPressed = true;
                print("Tombol ditekan");
              });
            },
            onTapUp: (_) {
              setState(() {
                _isPressed = false;
                print("Tombol dilepaskan");
              });
            },
            onTapCancel: () {
              setState(() {
                _isPressed = false;
                print("Pencetan dibatalkan");
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: _isPressed ? buttonColor : accentColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, size: 20, color: textColor),
                    SizedBox(width: 3),
                    Text(
                      "Add New",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14, // Mengatur ukuran teks
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
