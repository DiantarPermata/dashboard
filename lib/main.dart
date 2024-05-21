import 'package:dashboard/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dashboard/bloc/user_bloc.dart';
import 'package:dashboard/provider/menu_provider.dart';
import 'package:dashboard/provider/user_provider.dart';
import 'pages/dashboard/dashboard.dart';
import 'pages/documents/documents.dart';
import 'pages/notif/notif.dart';
import 'pages/pagescreen.dart';
import 'pages/profile/profile.dart';
import 'pages/settings/settings.dart';
import 'pages/store/store.dart';
import 'pages/task/task.dart';
import 'pages/transaction/transaction.dart';
import 'theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<NavigationProvider>(
            create: (_) => NavigationProvider()),
        BlocProvider<UserBloc>(
          create: (context) =>
              UserBloc(context.read<UserProvider>())..add(FetchUser()),
        ),
      ],
      child: MaterialApp(
        title: 'Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: background,
          useMaterial3: true,
        ),
        home: PageScreen(),
        routes: {
          '/dashboard': (context) => Dashboard(),
          '/transaction': (context) => Transaction(),
          '/task': (context) => Task(),
          '/documents': (context) => Documents(),
          '/store': (context) => Store(),
          '/notification': (context) => Notif(),
          '/profile': (context) => Profile(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
