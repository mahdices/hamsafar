import 'package:flutter/material.dart';
import 'package:hamsafar/home_page.dart';
import 'package:hamsafar/login_page.dart';
import 'package:hamsafar/pages/edit_financial_page.dart';
import 'package:hamsafar/pages/profile_page.dart';
import 'package:hamsafar/pages/wallet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return Directionality(textDirection: TextDirection.rtl, child: widget!);
      },
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Dana'),
      home: const LoginPage(),
      routes: {
        "/home": (context) => HomePage(),
        "/profile": (context) => const ProfilePage(),
        "/edit-financial": (context) =>  EditFinancialPage(),
        "/wallet": (context) =>  WalletPage(),
      },
    );
  }
}
