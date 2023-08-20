import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/features/users/presentation/users_screen.dart';
import 'core/injection_container.dart' as di;
import 'core/injection_container.dart';
import 'features/users/presentation/bloc/bloc/search_users_bloc.dart';
import 'features/users/presentation/bloc/cubit/enable_button_cubbit.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EnableButtonCubbit(),
        ),
        BlocProvider(
          create: (context) => SearchUsersBloc(useCase: getIt.call()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GitHub Users',
        theme: ThemeData(primaryColor: primaryColor),
        routes: {
          "/": (context) {
            return const UsersScreen();
          },
        },
      ),
    );
  }
}

const Color primaryColor = Color.fromRGBO(76, 175, 80, 1);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
