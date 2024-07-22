import 'package:flutter/material.dart';
import 'package:pompapp/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        cardColor: const Color(0xFFF4EDDB),
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}


