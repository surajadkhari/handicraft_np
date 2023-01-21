import 'package:flutter/material.dart';
import 'package:handicraft_product/const/app_const.dart';
import 'package:handicraft_product/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Product Sans",
          appBarTheme:
              const AppBarTheme(backgroundColor: Appcontant.primaryColor)),
      home: const HomeScreen(),
    );
  }
}
