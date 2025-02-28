import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_4/views/pages/login_page.dart';
import 'package:test_4/views/widget_tree.dart';
import 'package:test_4/widgets/hero_widget.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lotties/welcome.json',height: 400.0),
              SizedBox(height: 20.0),
              Text("Flutter app is way to learn Flutter",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
                textAlign:TextAlign.justify,
              ),
              SizedBox(height: 20.0),
              FilledButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage(title: 'Login',);
                        },
                        )
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text("Next")
              ),
              SizedBox(height: 50.0,)
            ],

          ),
        ),
      ),
    );
  }

}
