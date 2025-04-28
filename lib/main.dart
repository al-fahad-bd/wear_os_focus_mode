import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear_os_demo/focus_timer/view/focus_timer_screen.dart';
import 'package:wear_os_demo/date_page/view/date_screen.dart';

void main() => runApp(const FocusTimerApp());

class FocusTimerApp extends StatelessWidget {
  const FocusTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const FocusTimerScreen()),
        GetPage(name: '/date', page: () => const DateScreen()),
      ],
      home: const FocusTimerScreen(),
    );
  }
}
