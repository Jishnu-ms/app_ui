import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/CustomButton.dart';
import 'package:flutter_application_1/pages/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false; // store checkbox state here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          true, // ensures screen resizes when keyboard appears
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 34),
                      Text(
                        "Register to join us",
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
                        placeholder: "Create Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 24),
                      CustomTextField(
                        placeholder: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),

                      // Checkbox row
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: Colors.deepPurple, // violet fill
                          ),
                          const Expanded(
                            child: Text(
                              "I agree to the terms and conditions",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      CustomButton(
                        buttonColor: Colors.deepPurpleAccent,
                        text: "Register",
                        textColor: Colors.white,
                        borderColor: Colors.deepPurpleAccent,
                        borderWidth: 2,
                        onTap: () {
                          print("Register button tapped!");
                        },
                      ),

                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
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

                      SizedBox(height: 30), // pushes bottom text to bottom

                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account? ",
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
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
