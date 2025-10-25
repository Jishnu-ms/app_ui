import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CustomButton.dart';
import 'package:flutter_application_1/pages/Register.dart';
import 'package:flutter_application_1/pages/login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> users = ["Olivia", "Liam", "Emma"];
    final currentUser = users[0];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( // 👈 Added scroll view
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Image.asset(
                    'assets/logo.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 34),
                  Text(
                    "Welcome Back, $currentUser",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Welcome back! Please enter your details",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 34),

                  // Login Button
                  CustomButton(
                    buttonColor: Colors.deepPurpleAccent,
                    text: "Login",
                    textColor: Colors.white,
                    borderColor: Colors.deepPurpleAccent,
                    borderWidth: 2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Sign Up Button
                  CustomButton(
                    buttonColor: Colors.white,
                    text: "Sign Up",
                    textColor: Colors.deepPurple,
                    borderColor: Colors.grey,
                    borderWidth: 1,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  Row(
                    children: const [
                      Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Google Button
                  CustomButton(
                    buttonColor: Colors.white,
                    borderColor: Colors.grey,
                    borderWidth: 1,
                    onTap: () {
                      print("Google button tapped!");
                    },
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 24,
                      color: Colors.red,
                    ),
                    text: "Continue with Google",
                    textColor: Colors.black,
                  ),

                  const SizedBox(height: 20),

                  // Apple Button
                  CustomButton(
                    buttonColor: Colors.white,
                    borderColor: Colors.grey,
                    borderWidth: 1,
                    onTap: () {
                      print("Apple button tapped!");
                    },
                    icon: const Icon(
                      Icons.apple,
                      size: 24,
                      color: Colors.black,
                    ),
                    text: "Continue with Apple",
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
