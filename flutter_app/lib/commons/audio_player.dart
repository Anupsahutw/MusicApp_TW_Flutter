import 'package:assets_audio_player/assets_audio_player.dart';

class SingletonAudioPlayer {
  static final SingletonAudioPlayer _singleton =
      SingletonAudioPlayer._internal();

  factory SingletonAudioPlayer() {
    return _singleton;
  }

  SingletonAudioPlayer._internal();

  var assetsAudioPlayer = AssetsAudioPlayer();
}
