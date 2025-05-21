import 'package:flutter/material.dart';
import 'package:helloworld/view/pages/login_page.dart';
import 'package:helloworld/view/pages/onboarding.dart';
import 'package:helloworld/view/pages/widget_tree.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 500,
                  height: 500,
                  child: Lottie.asset(
                    'assets/lotties/welcome.json',
                    height: 400.0,
                  ),
                ),
                FittedBox(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      letterSpacing: 100.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WidgetTree();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Get started'),
                ),
                InkWell(
                  splashColor: Colors.black26,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OnboardingPage();
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0),
                    ),
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
