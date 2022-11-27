import 'dart:async';
import 'package:flutter/material.dart';

import '../../controller/constant/color.dart';
import '../main_screen/main_screen.dart';



class CustomSplash extends StatefulWidget {
  const CustomSplash({Key? key}) : super(key: key);

  @override
  State<CustomSplash> createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animationFoodiesIn;

  void _animationExecution() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationFoodiesIn = Tween(begin: 0.0, end: 1.00).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.1, curve: Curves.bounceInOut)));
  }

  @override
  void initState() {
    _animationExecution();
  //  startTimer(context);
        super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void startTimer(BuildContext context){
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
      return Material(child: Container(
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
              scale: _animationFoodiesIn.value,
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/uber_logo.png' ))),
        ],
      )
    ),);});
  }
}
