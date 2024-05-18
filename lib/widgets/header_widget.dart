import 'package:flutter/material.dart';
import 'package:dashboard/theme/color.dart'; // Ensure this path is correct

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 20),
          Text(
            'Dashboard',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: textColor,
                      ),
                      fillColor: textFieldColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 20.0),
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                          color: accentColor, // Color of the icon button
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.search, color: textColor),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
