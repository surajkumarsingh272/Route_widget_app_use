import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  final String name;
  const ProfileScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "Welcome $name",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
