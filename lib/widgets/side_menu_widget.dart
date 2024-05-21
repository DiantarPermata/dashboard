import 'package:dashboard/data/side_menu_data.dart';
import 'package:dashboard/provider/menu_provider.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Image.asset('images/logo-example.png', height: 250),
          SizedBox(height: 20),
          Divider(
            color: textColor,
            thickness: 1,
            height: 30,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: data.menu.length,
              itemBuilder: (context, index) =>
                  buildMenuEntry(context, data, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuEntry(BuildContext context, SideMenuData data, int index) {
    final isSelected =
        context.watch<NavigationProvider>().selectedIndex == index;

    return InkWell(
      onTap: () {
        context.read<NavigationProvider>().setSelectedIndex(index);
        Navigator.pushNamed(
            context, context.read<NavigationProvider>().currentRoute);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: isSelected ? buttonColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Icon(
                    data.menu[index].icon,
                    color: isSelected ? background : textColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    data.menu[index].title,
                    style: TextStyle(
                      color: isSelected ? background : textColor,
                      fontSize: 16.0,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
