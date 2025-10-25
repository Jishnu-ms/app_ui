import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/CustomButton.dart';
import 'package:flutter_application_1/pages/Register.dart';
import 'package:flutter_application_1/pages/forgotPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false; // checkbox state
  final List<String> users = ["Olivia", "Liam", "Emma"];
  late String currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = users[0]; // dynamic user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // prevent overflow when keyboard shows
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 34),
                      Text(
                        "Welcome Back, $currentUser",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Welcome back! Please enter your details",
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 34),
                      CustomTextField(
                        placeholder: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 24),
                      CustomTextField(
                        placeholder: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),

                      // Remember Me + Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                activeColor: Colors.deepPurple,
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const forgotPassword(),
                    ),
                  );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        buttonColor: Colors.deepPurpleAccent,
                        text: "Login",
                        textColor: Colors.white,
                        borderColor: Colors.deepPurpleAccent,
                        borderWidth: 2,
                        onTap: () {
                          print("Login tapped!");
                        },
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(color: Colors.grey, thickness: 1)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Divider(color: Colors.grey, thickness: 1)),
                        ],
                      ),
                      SizedBox(height: 24),
                      CustomButton(
                        buttonColor: Colors.white,
                        borderColor: Colors.grey,
                        borderWidth: 1,
                        onTap: () {
                          print("Google button tapped!");
                        },
                        icon: Icon(
                          Icons.g_mobiledata,
                          size: 24,
                          color: Colors.red,
                        ),
                        text: "Continue with Google",
                        textColor: Colors.black,
                      ),
                     
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
