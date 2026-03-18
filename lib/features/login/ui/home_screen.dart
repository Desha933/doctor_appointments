import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          color: Colors.amber,
          child: Column(children: [Text("home screen")]),
        ),
      ),
    );
  }
}
