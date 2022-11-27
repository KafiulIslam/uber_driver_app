import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:uber_driver_app/view/auth/create_driver_account.dart';
import 'package:uber_driver_app/view/auth/login_screen.dart';
import 'controller/constant/color.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Uber Driver App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AnimatedSplashScreen(
        duration: 1000,
        splashIconSize: 180,
        splash: 'assets/images/uber_logo.png',
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: primaryColor),
  )));
}

class MyApp extends StatefulWidget {
  final Widget? child;

  const MyApp({Key? key, this.child}) : super(key: key);

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child!);
  }
}
