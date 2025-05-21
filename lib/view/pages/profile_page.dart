import 'package:flutter/material.dart';
import 'package:helloworld/data/notifiers.dart';
import 'package:helloworld/view/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/bg.png'),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                selectedPageNotifier.value = 0;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
