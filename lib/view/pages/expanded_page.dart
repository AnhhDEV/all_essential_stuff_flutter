import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(flex: 4, child: Container(color: Colors.teal, height: 20)),
          Flexible(
            fit: FlexFit.loose,
            child: Container(color: Colors.amber, height: 20, child: Text('Data'),),
          ),
        ],
      ),
    );
  }
}
