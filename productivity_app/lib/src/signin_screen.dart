import 'package:flutter/material.dart';
import 'package:productivity_app/Services/authentication.dart';
import 'package:productivity_app/services/google_auth.dart';
import 'package:productivity_app/src/forgot_password.dart';
import 'package:productivity_app/src/homescreen.dart';
import 'package:productivity_app/src/signup_screen.dart';
import 'package:productivity_app/widgets/button.dart';
import 'package:productivity_app/widgets/snackbar.dart';
import 'package:productivity_app/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Email and password auth part
  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // Sign up user using our auth method
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      // Navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // Show error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 2.9,
                child: Image.asset('assets/images/login.png'),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Login!',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(-1.8, -1.8),
                        color: Colors.white,
                        blurRadius: 5.0,
                      ),
                      Shadow(
                        offset: Offset(1.8, 1.8),
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextFieldInput(
                icon: Icons.person_2_outlined,
                textEditingController: emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.text,
              ),
              TextFieldInput(
                icon: Icons.lock_outline_rounded,
                textEditingController: passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const ForgotPassword(),
              MyButtons(onTap: loginUser, text: "Log In"),
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: Colors.black26),
                  ),
                  const Text("  or  "),
                  Expanded(
                    child: Container(height: 1, color: Colors.black26),
                  ),
                ],
              ),
              // Google login
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          child: Image.network(
                            "https://ouch-cdn2.icons8.com/VGHyfDgzIiyEwg3RIll1nYupfj653vnEPRLr0AeoJ8g/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODg2/LzRjNzU2YThjLTQx/MjgtNGZlZS04MDNl/LTAwMTM0YzEwOTMy/Ny5wbmc.png",
                            height: 35,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: const Text(
                            "Continue with Google",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 97, 97, 97),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.8, -1.8),
                              color: Colors.white,
                              blurRadius: 5.0,
                            ),
                            Shadow(
                              offset: Offset(1.8, 1.8),
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
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
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black45,
          width: 2,
        ),
      ),
      child: Image.network(
        image,
        height: 40,
      ),
    );
  }
}
