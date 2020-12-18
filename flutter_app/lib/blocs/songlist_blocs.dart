import 'dart:async';
import 'package:flutterapp/model/songs.dart';
import 'package:flutterapp/repository/playlist_repository.dart';
import 'package:flutterapp/services/api_response.dart';
import 'package:flutterapp/services/network.dart';
import 'package:flutterapp/utilities/app_constants.dart';
import 'package:flutterapp/viewmodel/song_display_view_model.dart';

class SongBloc {
  PlayListRepository _playListRepository;

  StreamController _songListController;

  StreamSink<ApiResponse<List<SongDisplayViewModel>>> get songListSink =>
      _songListController.sink;

  Stream<ApiResponse<List<SongDisplayViewModel>>> get songListStream =>
      _songListController.stream;

  ApiBaseHelper _helper = ApiBaseHelper();
  List<SongDisplayViewModel> songsUI;

  SongBloc() {
    _songListController =
        StreamController<ApiResponse<List<SongDisplayViewModel>>>();
    this._playListRepository = PlayListRepository(_helper);
    // fetchSongList(artist);
  }

  fetchSongList(String artist) async {
    songListSink.add(ApiResponse.loading(AppConstants.fetchingPopularSongs));
    await fetchSongs(artist, this._playListRepository);
  }

  Future fetchSongs(
      String artist, PlayListRepository _playListRepository) async {
    try {
      List<Results> songs = await _playListRepository.fetchSongList(artist);
      songsUI = songs.map((results) => SongDisplayViewModel(results)).toList();
      if (songsUI.length == 0)
        songListSink.add(ApiResponse.emptyResult(AppConstants.noSongs));
      else
        songListSink.add(ApiResponse.completed(songsUI));
    } catch (e) {
      songListSink.add(ApiResponse.error(AppConstants.wentWrong));
      print(e);
    }
  }

  dispose() {
    _songListController?.close();
  }
}
