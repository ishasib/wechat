import 'dart:math';
import 'dart:ui';

import 'package:chat_appp/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimated = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {
      print('\nUser: ${user.user}');
      print('\nUserAdditionalInfo: ${user.additionalUserInfo}');

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Define a getter for the media query size
  Size get mq => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    // Use the `mq` getter to get the media query size
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * .00005,
            right: _isAnimated ? mq.width * .25 : -mq.width * .15,
            width: mq.width * .15,
            duration: Duration(seconds: 2),
            child: Image.asset('images/rating.png'),
          ),
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .5,
            height: mq.height * .07,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: StadiumBorder(),
                  elevation: 1,
                ),
                onPressed: () {
                  _handleGoogleBtnClick();
                },
                icon: Image.asset(
                  'images/google.png',
                  height: mq.height * .03,
                ),
                label: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        children: [
                      TextSpan(text: 'Log in With '),
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ]))),
          ),
        ],
      ),
    );
  }
}
