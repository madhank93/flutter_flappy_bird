import 'package:hive/hive.dart';

class HighScoreManager {
  HighScoreManager._internal();

  static HighScoreManager _instance = HighScoreManager._internal();

  static HighScoreManager get instance => _instance;
  Box _score;

  Future<void> init() async {
    _score = await Hive.openBox('score');

    if (_score.get('high_score') == null) {
      _score.put("high_score", 0);
    }
  }

  void setHighScore(int score) {
    _score.put("high_score", score);
  }

  int get getHighScore {
    return _score.get('high_score');
  }
}
