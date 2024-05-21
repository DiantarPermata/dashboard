import 'package:dashboard/bloc/user_event.dart';
import 'package:dashboard/pages/dashboard/widget/widget_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard/bloc/user_bloc.dart';
import 'package:dashboard/bloc/user_state.dart';
import 'package:dashboard/model/user_model.dart';
import 'package:dashboard/theme/color.dart';

class HeaderWidgetDashboard extends StatelessWidget {
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
                SizedBox(width: 20),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoaded) {
                      return buildUserMenu(context, state.user);
                    } else if (state is UserLoading) {
                      return CircularProgressIndicator();
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserMenu(BuildContext context, UserModel user) {
    return PopupMenuButton<int>(
      onSelected: (item) => onSelect(context, item, user),
      itemBuilder: (context) => [
        PopupMenuItem<int>(value: 0, child: Text('Account settings')),
        PopupMenuItem<int>(value: 1, child: Text('Switch account')),
        PopupMenuItem<int>(value: 2, child: Text('Sign out')),
      ],
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Text(user.name[0]),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name),
              Text(user.email),
            ],
          ),
        ],
      ),
    );
  }

  void onSelect(BuildContext context, int item, UserModel currentUser) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, '/profile');
        break;
      case 1:
        showDialog(
          context: context,
          builder: (context) => AccountSwitcherDialog(currentUser: currentUser),
        );
        break;
      case 2:
        BlocProvider.of<UserBloc>(context).add(ClearUser());
        Navigator.pushReplacementNamed(context, '/');
        break;
    }
  }
}
