import 'package:flame/flame.dart';
import 'package:flappy_bird/main_game/high_score_manager.dart';
import 'package:flappy_bird/main_game/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'main_game/audio_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setPortrait();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await AudioManager.instance.init(['bgm.mp3', 'hit.wav', 'jump.wav']);
  await HighScoreManager.instance.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash',
      theme: ThemeData(
        fontFamily: 'AudioWide',
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}
