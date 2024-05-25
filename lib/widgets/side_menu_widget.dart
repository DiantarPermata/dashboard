import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard/theme/color.dart';
import 'package:dashboard/data/side_menu_data.dart';
import 'package:dashboard/bloc/navigation/navigation_bloc.dart';

class SideMenuWidget extends StatefulWidget {
  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is NavigationSuccess) {
          selectedIndex = state.selectedIndex;
        }

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
                      buildMenuEntry(data, index, selectedIndex),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index, int selectedIndex) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        BlocProvider.of<NavigationBloc>(context)
            .add(NavigateToPageEvent(context, data.menu[index].route, index));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? buttonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
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
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
