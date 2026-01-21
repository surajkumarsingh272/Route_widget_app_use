import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Home page",style: TextStyle(color: Colors.white),),
       backgroundColor: Colors.green,
     ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/profile',extra: "suraj",);
              },
              child: Text("Go to Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/settings');
              },
              child: Text("Go to Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
