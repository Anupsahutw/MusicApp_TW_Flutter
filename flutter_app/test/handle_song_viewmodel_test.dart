import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/viewmodel/song_display_view_model.dart';
import 'package:flutterapp/model/songs.dart';
import 'package:flutterapp/viewmodel/handle_song_list_viewmodel.dart';

void main() {
  HandleSongListViewModel handleSongListViewModel;
  List<SongDisplayViewModel> songList;
  setUp(() {
    handleSongListViewModel = HandleSongListViewModel();
    songList = [
      SongDisplayViewModel(
        Results(),
      ),
      SongDisplayViewModel(
        Results(),
      ),
    ];
  });

  test("is clicked song start play", () {
    handleSongListViewModel.handlePlaySong(1, null, songList);
    expect(songList[1].isPlaying, true);
  });

  test("is same clicked song pause", () {
    songList[1].setIsPlaying(true);
    handleSongListViewModel.handlePlaySong(1, 1, songList);
    expect(songList[1].isPlaying, false);
  });

  test("is previous song stopped", () {
    songList[0].setIsPlaying(true);
    handleSongListViewModel.handlePlaySong(1, 0, songList);
    expect(songList[0].isPlaying, false);
  });

  test("is media player invisible when song stopped", () {
    songList[0].setIsPlaying(false);
    handleSongListViewModel.currentSongIsPlaying(songList, 0);
    expect(songList[0].isPlaying, false);
  });

  test("is media player visible when song played", () {
    songList[0].setIsPlaying(true);
    handleSongListViewModel.currentSongIsPlaying(songList, 0);
    expect(songList[0].isPlaying, true);
  });
}
