import 'package:flutter/material.dart';

class VisitAgain extends StatelessWidget {
  const VisitAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset("images/thankyou_image.jpg"),
      ),
    );
  }
}
