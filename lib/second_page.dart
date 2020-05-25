import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String payload;

  SecondPage(this.payload);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(payload),
      ),
    );
  }
}
