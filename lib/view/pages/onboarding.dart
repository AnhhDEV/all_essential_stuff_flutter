import 'package:flutter/material.dart';
import 'package:helloworld/data/constants.dart';
import 'package:helloworld/view/pages/login_page.dart';
import 'package:helloworld/view/pages/widget_tree.dart';
import 'package:helloworld/view/pages/widgets/hero_widget.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/welcome.json'),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                Text(
                  'Flutter mapp is the way to learn Flutter period',
                  style: KTextStyle.titleTealStyle,
                  textAlign: TextAlign.justify,
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Login');
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 150.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
