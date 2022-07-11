import 'package:flutter/material.dart';
import 'package:naughtech/global/app.dart';
import 'package:naughtech/landing_page.dart';

class Naughtech extends StatelessWidget {
  const Naughtech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alnaughtech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: const ColorScheme(
          background: bgColor,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: bgColor,
          onError: Colors.red,
          onSecondary: Colors.white,
          onPrimary: primary,
          onSurface: Colors.white,
          primary: primary,
          secondary: Colors.white,
          surface: bgColor,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: bgColor,
        ),
        fontFamily: "Alumni",
      ),
      home: const LandingPage(),
    );
  }
}
