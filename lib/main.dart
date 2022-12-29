import 'package:flutter/material.dart';
import 'package:private_upload/auth/privateprovider.dart';
import 'package:private_upload/pages/home.dart';
import 'package:private_upload/pages/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => PrivateProvider(),
      lazy: false,
      child: MaterialApp(
        title: 'Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<PrivateProvider>(
          builder: (context, state, child) {
            // Home(key: key, title: "Home");
            if (state.isLoggedin == true) {
              return Homepage(key: key, title: "Home");
            } else {
              return const Login();
            }
          },
        ),
      ));
}
