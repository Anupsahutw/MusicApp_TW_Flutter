// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutterapp/blocs/songlist_blocs.dart';
import 'package:flutterapp/viewmodel/song_display_view_model.dart';
import 'package:flutterapp/repository/playlist_repository.dart';
import 'package:flutterapp/services/api_response.dart';
import 'package:flutterapp/services/network.dart';

import 'mock_response.dart';
import 'playlist_repository_test.dart';

void main() {
  SongBloc bloc;
  PlayListRepository repo;

  StreamController _songListController;

  StreamSink<ApiResponse<List<SongDisplayViewModel>>> _songListSink;

  Stream<ApiResponse<List<SongDisplayViewModel>>> songListStream;

  ApiBaseHelper _helper;

  setUp(() {
    _songListController =
        StreamController<ApiResponse<List<SongDisplayViewModel>>>();
  });

  test("song list is fetch", () async {
    bloc = SongBloc();
    _helper = MockApiBaseHelper();
    repo = PlayListRepository(_helper);
    when(_helper.get('/search?types=${"artists"}&term=*'))
        .thenAnswer((realInvocation) => Future<dynamic>.value(response2));
    // var actual = await repo.fetchSongList("*");

    await bloc.fetchSongs("*", repo);
    expectLater(bloc.songsUI.length, 1);
    expectLater(await bloc.songListStream.isEmpty, false);
  });

  test("song list is added to stream", () async {
    bloc = SongBloc();
    _helper = MockApiBaseHelper();
    repo = PlayListRepository(_helper);
    when(_helper.get('/search?types=${"artists"}&term=*'))
        .thenAnswer((realInvocation) => Future<dynamic>.value(response2));
    // var actual = await repo.fetchSongList("*");

    await bloc.fetchSongs("*", repo);
    var empty = await bloc.songListStream.isEmpty;
    expectLater(empty, false);
  });

  test("stream has empty message when result is empty", () async {
    bloc = SongBloc();
    _helper = MockApiBaseHelper();
    repo = PlayListRepository(_helper);
    when(_helper.get('/search?types=${"artists"}&term=*'))
        .thenAnswer((realInvocation) => Future<dynamic>.value(response));
    // var actual = await repo.fetchSongList("*");

    await bloc.fetchSongs("*", repo);
    var result = await bloc.songListStream.first;
    expectLater(result.message, "No songs Available!!");
  });

  test("stream has error message when result has wrong data type", () async {
    bloc = SongBloc();
    _helper = MockApiBaseHelper();
    repo = PlayListRepository(_helper);
    when(_helper.get('/search?types=${"artists"}&term=*'))
        .thenAnswer((realInvocation) => Future<dynamic>.value(response3));

    await bloc.fetchSongs("*", repo);
    var result = await bloc.songListStream.first;
    expectLater(result.message, "Something went wrong please try later!!");
  });
}
