import 'package:chat_appp/home_screen.dart';
import 'package:chat_appp/screens/auth/loginn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import 'auth/loginn.dart';
//splash screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  // Define a getter for the media query size
  Size get mq => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    // Use the `mq` getter to get the media query size
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .00005,
            right: mq.width * .25,
            width: mq.width * .15,
            child: Image.asset('images/rating.png'),
          ),
          Positioned(
              bottom: mq.height * .15,
              left: mq.width * .05,
              width: mq.width * .5,
              height: mq.height * .07,
              child: const Text(
                'MADE IN BAN ❤️',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, color: Colors.black87, letterSpacing: .5),
              ))
        ],
      ),
    );
  }
}
