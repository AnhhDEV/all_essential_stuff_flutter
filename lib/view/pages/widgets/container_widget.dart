import 'package:flutter/material.dart';

import '../../../data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Basic layout', style: KTextStyle.titleTealStyle),
              Text('Description of this', style: KTextStyle.descriptionText),
            ],
          ),
        ),
      ),
    );
  }
}
