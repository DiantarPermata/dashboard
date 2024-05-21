import 'package:dashboard/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard/bloc/user_bloc.dart';
import 'package:dashboard/bloc/user_event.dart';
import 'package:dashboard/model/user_model.dart';

class AccountSwitcherDialog extends StatefulWidget {
  final UserModel currentUser;

  const AccountSwitcherDialog({Key? key, required this.currentUser})
      : super(key: key);

  @override
  _AccountSwitcherDialogState createState() => _AccountSwitcherDialogState();
}

class _AccountSwitcherDialogState extends State<AccountSwitcherDialog> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Switch Account'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current Account:'),
          SizedBox(height: 8),
          Text('${widget.currentUser.name} (${widget.currentUser.email})'),
          SizedBox(height: 16),
          Text('Available Accounts:'),
          SizedBox(height: 8),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return CircularProgressIndicator();
              } else if (state is UserLoaded) {
                return Column(
                  children: _buildAccountList(state.users),
                );
              } else {
                return Text('Failed to load accounts');
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }

  List<Widget> _buildAccountList(List<UserModel> accounts) {
    return accounts.map((account) {
      return ListTile(
        title: Text(account.name),
        subtitle: Text(account.email),
        trailing: account == widget.currentUser
            ? Icon(Icons.check_circle, color: Colors.green)
            : null,
        onTap: () {
          if (account != widget.currentUser) {
            context.read<UserBloc>().add(SwitchUser(account));
            Navigator.pop(context);
          }
        },
      );
    }).toList();
  }
}
