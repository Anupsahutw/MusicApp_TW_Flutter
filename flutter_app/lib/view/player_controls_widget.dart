import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/commons/audio_player.dart';
import 'package:flutterapp/viewmodel/song_display_view_model.dart';

class PlayerControlWidget extends StatefulWidget {
  final Function(bool isPlaying, List<SongDisplayViewModel> songList,
      int currentPlayedAudioIndex) callback;

  PlayerControlWidget({Key key, this.callback}) : super(key: key);
  @override
  PlayControlState createState() => PlayControlState();
}

class PlayControlState extends State<PlayerControlWidget> {
  StreamSubscription<void> _playerSub;
  AssetsAudioPlayer _audio;

  bool _isPlaying = false;
  bool _visible = false;
  String currentSongUrl;
  List<SongDisplayViewModel> songList;
  int currentPlayedAudioIndex;
  String previousSongUrl;

  @override
  void initState() {
    super.initState();
    var playSongViewModel = SingletonAudioPlayer();
    _audio = playSongViewModel.assetsAudioPlayer;
    _playerSub = _audio.playlistAudioFinished.listen((event) {
      _clearPlayer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _playerSub.cancel();
    _audio.dispose();
  }

  void _clearPlayer() {
    setState(() {
      _isPlaying = false;
      _visible = false;
    });
    widget.callback(false, songList, currentPlayedAudioIndex);
  }

  void setStateOnPlay(bool playing, bool visible) {
    setState(() {
      _isPlaying = playing;
      _visible = visible;
    });
  }

  void setCurrentSongUrl(String url, List<SongDisplayViewModel> songList,
      int currentPlayedAudioIndex) {
    currentSongUrl = url;
    this.songList = songList;
    this.currentPlayedAudioIndex = currentPlayedAudioIndex;
  }

  void play() {
    playPauseAudio(true);
  }

  Future playPauseAudio(bool isPlaying) async {
    await _audio.playOrPause();
    setStateOnPlay(isPlaying, true);
    widget.callback(isPlaying, songList, currentPlayedAudioIndex);
  }

  void pause() {
    playPauseAudio(false);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Container(
        alignment: FractionalOffset.bottomCenter,
        child: IconButton(
          icon: (_isPlaying)
              ? Icon(Icons.pause_circle_filled)
              : Icon(Icons.play_circle_outline),
          iconSize: 60,
          onPressed: () => _isPlaying ? pause() : play(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
