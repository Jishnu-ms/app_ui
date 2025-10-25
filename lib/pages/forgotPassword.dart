import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/CustomButton.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          // centers the Column vertically and horizontally
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 34),
                Text(
                  "Confirm your email",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign:
                      TextAlign.center, // ensures multi-line text is centered
                ),
                SizedBox(height: 12),
                Text(
                  "Enter the email associated with your account and we'll send an email with code to reset your password",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 34),
                CustomTextField(
                  placeholder: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24),
                CustomButton(
                  buttonColor: Colors.deepPurpleAccent,
                  borderColor: Colors.deepPurple,
                  borderWidth: 2,
                  onTap: () {
                    print("Violet button tapped!");
                  },
                  text: "Send Code",
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
