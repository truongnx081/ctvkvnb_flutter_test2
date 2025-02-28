import 'package:flutter/material.dart';
import 'package:test_4/views/pages/home_page.dart';
import 'package:test_4/views/pages/login_page.dart';
import 'package:test_4/views/pages/onboarding.dart';
import 'package:test_4/views/widget_tree.dart';
import 'package:test_4/widgets/hero_widget.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/lotties/welcome.json',height: 400.0),
                FittedBox(
                  child: Text("Flutter App",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      letterSpacing: 50.0
                    ),
                  )
                ),
                SizedBox(height: 20.0,),
                FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          // return LoginPage(title: 'Register',);
                          return OnboardingPage();
                        },
                        )
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0)
                    ),
                    child: Text("Get Started")
                ),
                TextButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginPage(title: 'Login',);
                      },
                      )
                  );
                },
                  style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0)
                  ),
                  child: Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
