import 'package:flutterapp/model/songs.dart';
import 'package:flutterapp/services/network.dart';

class PlayListRepository {
  ApiBaseHelper _helper;
  PlayListRepository(this._helper);

  Future<List<Results>> fetchSongList(String query) async {
    final response =
        await _helper.get("/search?types=${"artists"}&term=$query");
    return Songs.fromJson(response).results;
  }
}
