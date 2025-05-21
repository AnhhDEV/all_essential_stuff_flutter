import 'package:flutter/material.dart';
import 'package:helloworld/data/constants.dart';
import 'package:helloworld/view/pages/course_page.dart';
import 'package:helloworld/view/pages/widgets/container_widget.dart';
import 'package:helloworld/view/pages/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeroWidget(title: 'Home', nextPage: CoursePage(),),
                Column(
                  children: List.generate(5, (index) {
                    return ContainerWidget(
                      title: 'Basic L ayout',
                      description: 'Description of this',
                    );
                  },)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
