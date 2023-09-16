
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(onPressed: (){}, child: Text("Logout")),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
