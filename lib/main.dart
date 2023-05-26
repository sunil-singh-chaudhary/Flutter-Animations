import 'package:card_animation/card_animation/card_animation_view.dart';
import 'package:flutter/material.dart';

//SCROLL SNAP LIST WE CAN CALL IT IN FLUTTER
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardAnimationView(),
    );
  }
}
