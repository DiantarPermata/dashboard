import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/page_routing/application.dart';
import 'helpers/page_routing/routes.dart';
import 'bloc/profile/profile_bloc.dart';
import 'bloc/profile/profile_event.dart';
import 'bloc/navigation/navigation_bloc.dart';
import 'bloc/header_title/header_title_bloc.dart'; // Tambahkan ini

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(FetchProfile()),
        ),
        BlocProvider(
          create: (context) => HeaderTitleBloc(), // Tambahkan ini
        ),
      ],
      child: MaterialApp(
        title: 'Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: true,
        ),
        onGenerateRoute: Application.router.generator,
        initialRoute: Routes.home,
      ),
    );
  }
}
