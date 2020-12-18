import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/commons/debounce.dart';
import 'package:flutterapp/utilities/app_constants.dart';
import 'package:flutterapp/services/api_response.dart';
import 'package:flutterapp/view/player_controls_widget.dart';
import 'package:flutterapp/view/song_list_widget.dart';
import 'package:flutterapp/blocs/songlist_blocs.dart';
import 'package:flutterapp/viewmodel/handle_song_list_viewmodel.dart';
import 'package:flutterapp/viewmodel/song_display_view_model.dart';

import '../commons/loading.dart';
import '../commons/show_error.dart';
import '../commons/empty_results.dart';

class PlayListSearch extends StatefulWidget {
  @override
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<PlayListSearch> {
  SongBloc _bloc;
  String _allSongs = "*";
  TextEditingController _textController = TextEditingController();
  GlobalKey<PlayControlState> _myKey = GlobalKey();
  GlobalKey<SongListWidgetState> _myKeySongList = GlobalKey();
  final _debounce = Debounce(milliseconds: 2000);
  var handleSongListViewModel = HandleSongListViewModel();
  @override
  void initState() {
    super.initState();
    _textController.clear();
    _bloc = SongBloc();
    _bloc.fetchSongList(_allSongs);
  }

  onItemChanged(String artistName) {
    _debounce.run(() {
      artistName.trim().isNotEmpty
          ? _bloc.fetchSongList(artistName.trim())
          : _bloc.fetchSongList(_allSongs);
    });
  }

  onSongPlayed(int currentPlayedAudioIndex, int previousPlayedAudioIndex,
      List<SongDisplayViewModel> songList) {
    String currentSongUrl = "";
    currentSongUrl = songList[currentPlayedAudioIndex].previewUrl;
    _myKey.currentState
        .setCurrentSongUrl(currentSongUrl, songList, currentPlayedAudioIndex);
    var isPlaying = handleSongListViewModel.currentSongIsPlaying(
        songList, currentPlayedAudioIndex);
    _myKey.currentState.setStateOnPlay(isPlaying, isPlaying);
  }

  onSongPaused() {
    _myKeySongList.currentState.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(AppConstants.navTitle,
            style: TextStyle(color: ColorsConstant.green, fontSize: 28)),
        backgroundColor: ColorsConstant.black,
      ),
      backgroundColor: ColorsConstant.black,
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: onPullToRefresh,
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: AppConstants.searchBy,
                  ),
                  onChanged: onItemChanged,
                ),
              ),
            ),
            StreamBuilder<ApiResponse<List<SongDisplayViewModel>>>(
              stream: _bloc.songListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case Status.COMPLETED:
                      return SongListWidget(
                        key: _myKeySongList,
                        songList: snapshot.data.data,
                        callback: (currentSongIndex, previousPlayedAudioIndex,
                            songList) {
                          onSongPlayed(currentSongIndex,
                              previousPlayedAudioIndex, songList);
                        },
                      );
                      break;
                    case Status.ERROR:
                      return Error(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _bloc.fetchSongList(_allSongs),
                      );
                      break;
                    case Status.EMPTY:
                      return EmptyResult(
                        message: snapshot.data.message,
                      );
                  }
                }
                return Container();
              },
            ),
            PlayerControlWidget(
              key: _myKey,
              callback: (isPlaying, songList, currentPlayedAudioIndex) {
                callBackReceivedOnPlayPauseClicked(
                    songList, currentPlayedAudioIndex, isPlaying);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPullToRefresh() async {
    var text = _textController.value.text.trim();
    text.isEmpty ? _bloc.fetchSongList(_allSongs) : _bloc.fetchSongList(text);
  }

  void callBackReceivedOnPlayPauseClicked(List<SongDisplayViewModel> songList,
      int currentPlayedAudioIndex, bool isPlaying) {
    if (listEquals(songList, _myKeySongList.currentState.widget.songList)) {
      _myKeySongList.currentState.widget.songList[currentPlayedAudioIndex]
          .setIsPlaying(isPlaying);
      onSongPaused();
    }
  }

  @override
  void dispose() {
    _bloc.dispose();
    _textController.dispose();
    _debounce.cancelTimer();
    super.dispose();
  }
}
