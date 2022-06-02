import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Responsive/responsive.dart';
import 'package:whatsapp_ui_clone/Screen/mobileScreen.dart';
import 'package:whatsapp_ui_clone/Screen/webScreen.dart';
import 'package:whatsapp_ui_clone/colors.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Whatapp UI",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home:  ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout()),
    );
    
  }
}
