import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helloworld/view/pages/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/classes/activity_class.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          Widget widget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            Activity data = snapshot.data;
            widget = HeroWidget(title: data.activity);
          } else {
            widget = Center(child: Text('Error'));
          }
          return widget;
        },
      ),
    );
  }

  Future getData() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var item = jsonResponse['activity'];
      // log(response.body);
      final jsonData = jsonDecode(response.body);
      return Activity.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
