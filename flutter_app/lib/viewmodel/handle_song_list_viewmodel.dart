import 'package:flutterapp/viewmodel/song_display_view_model.dart';

class HandleSongListViewModel {
  List<SongDisplayViewModel> handlePlaySong(int currentSongIndex,
      int previousPlayedAudioIndex, List<SongDisplayViewModel> songList) {
    if (previousPlayedAudioIndex == currentSongIndex) {
      songList[currentSongIndex]
          .setIsPlaying(!songList[currentSongIndex].isPlaying);
    } else {
      if (previousPlayedAudioIndex != null) {
        songList[previousPlayedAudioIndex].setIsPlaying(false);
      }
      songList[currentSongIndex]
          .setIsPlaying(!songList[currentSongIndex].isPlaying);
    }
    return songList;
  }

  bool currentSongIsPlaying(
      List<SongDisplayViewModel> songList, int currentPlayedAudioIndex) {
    return (songList[currentPlayedAudioIndex].isPlaying) ? true : false;
  }
}
