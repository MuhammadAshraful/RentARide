import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Controller/verifyEmail_controller.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final EmailVerificationController _controller = EmailVerificationController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xF9d423).withOpacity(1),
                Color(0xFF4e50).withOpacity(1),
              ],
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 200),
              const Text(
                "Verify Your Email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                width: 500, // Set the desired width
                child: const Text(
                  "We've sent you an email verification. Please open it to verify your account. If you haven't received a verification email yet, press the button below",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                width: 500, // Set the desired width
                child: const Text(
                  "",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Image.asset(
                'assets/email.png',
                height: 200, // Adjust the height as needed
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                    // Other decoration properties...
                    ),
                child: TextButton(
                  onPressed: () async {
                    _controller.handleSendEmailVerification();
                  },
                  child: const Text(
                    'Send email verification',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
