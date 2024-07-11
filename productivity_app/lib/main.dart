import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/src/homescreen.dart';
import 'package:productivity_app/src/signin_screen.dart';
import 'package:productivity_app/src/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.crimsonTextTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen(); // Show a loading indicator while waiting
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Error occurred'),
              ),
            ); // Show an error message if there's an error
          } else if (snapshot.hasData && snapshot.data != null) {
            return const HomeScreen(); // User is authenticated, show the HomeScreen
          } else {
            return const LoginScreen(); // User is not authenticated, show the LoginScreen
          }
        },
      ),
    );
  }
}
