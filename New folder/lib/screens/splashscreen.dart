import 'dart:async';
import 'package:flipkart_clone/screens/homescreen.dart';
import 'package:flipkart_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _doAnimation();
  }

  _doAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    _animation.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    _moveToNextScreen();
  }

  _moveToNextScreen() {
    Timer(Duration(seconds: 6),
        () => Navigator.of(context).pushReplacementNamed(Constants.HOME_ROUTE));

    /*Timer(Duration(seconds: 5), ()=>{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>HomeScreen()))
    });*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.FLIPKART_BLUE),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  Constants.POWERED_BY,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constants.FLIPKART_SPLASH_LOGO,
                width: _animation.value * 250,
                height: _animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
