import 'package:expense/screens/splash_screen.dart';
import 'package:expense/utils/color_palatte.dart';
import 'package:expense/utils/my_scroll_behaviour.dart';
import 'package:expense/view_model.dart/expense_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ExpenseViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: ColorPalatte.primarySwatch,
      ),
      builder: (context, child) => ScrollConfiguration(
        behavior: MyBehavior(),
        child: child!,
      ),
      home: const SplashScreen(),
    );
  }
}
