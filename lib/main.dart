import 'package:flame/flame.dart';
import 'package:flappy_bird/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setPortrait();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'AudioWide',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
