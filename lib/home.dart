import 'package:attendance_app/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Hello from home"),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Auth().signOut();
              },
              child: const Text("LOGOUT"),
            )
          ],
        ),
      ),
    );
  }
}
