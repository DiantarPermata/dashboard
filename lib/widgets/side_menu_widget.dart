import 'package:dashboard/helpers/page_routing/application.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard/theme/color.dart';
import 'package:dashboard/data/side_menu_data.dart';
import 'package:dashboard/bloc/navigation/navigation_bloc.dart';
import 'package:dashboard/bloc/navigation/navigation_event.dart';
import 'package:dashboard/bloc/navigation/navigation_state.dart';
import 'package:dashboard/bloc/profile/profile_bloc.dart';
import 'package:dashboard/bloc/profile/profile_state.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: backgroundSecondaryColor, // Ubah warna background drawer
          child: Column(
            children: [
              Image.asset('images/logo-example.png', height: 150),
              SizedBox(height: 10),
              Divider(
                color: textColor,
                thickness: 1,
                height: 20,
              ),
              SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, profileState) {
                    return ListView.builder(
                      itemCount: data.menu.length,
                      itemBuilder: (context, index) {
                        final menuEntry = data.menu[index];
                        return buildMenuEntry(data, index, selectedIndex,
                            profileState.permissions);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index, int selectedIndex,
      List<String> permissions) {
    final isSelected = selectedIndex == index;
    final menuEntry = data.menu[index];

    return InkWell(
      onTap: () {
        if (permissions.contains(menuEntry.title.toLowerCase())) {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigateToPageEvent(context, menuEntry.route, index));
        } else {
          Application.router.navigateTo(context, Routes.noAccess,
              transition: TransitionType.fadeIn);
        }
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
                menuEntry.icon,
                color: isSelected ? background : textColor,
                size: 20, // Adjust icon size as needed
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    menuEntry.title,
                    style: TextStyle(
                      color: isSelected ? background : textColor,
                      fontSize: 14.0, // Adjust text size as needed
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
