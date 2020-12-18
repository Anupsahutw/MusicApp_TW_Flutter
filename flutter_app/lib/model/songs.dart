class Songs {
  int _resultCount;
  List<Results> _results;

  int get resultCount => _resultCount;
  List<Results> get results => _results;

  Songs({int resultCount, List<Results> results}) {
    _resultCount = resultCount;
    _results = results;
  }

  Songs.fromJson(dynamic json) {
    _resultCount = json["resultCount"];
    if (json["results"] != null) {
      _results = [];
      json["results"].forEach((v) {
        _results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["resultCount"] = _resultCount;
    if (_results != null) {
      map["results"] = _results.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Results {
  String _wrapperType;
  String _kind;
  int _collectionId;
  int _trackId;
  String _artistName;
  String _collectionName;
  String _trackName;
  String _collectionCensoredName;
  String _trackCensoredName;
  int _collectionArtistId;
  String _collectionArtistViewUrl;
  String _collectionViewUrl;
  String _trackViewUrl;
  String _previewUrl;
  String _artworkUrl30;
  String _artworkUrl60;
  String _artworkUrl100;
  double _collectionPrice;
  double _trackPrice;
  double _collectionHdPrice;
  double _trackHdPrice;
  String _releaseDate;
  String _collectionExplicitness;
  String _trackExplicitness;
  int _discCount;
  int _discNumber;
  int _trackCount;
  int _trackNumber;
  int _trackTimeMillis;
  String _country;
  String _currency;
  String _primaryGenreName;
  String _contentAdvisoryRating;
  String _longDescription;
  bool _hasITunesExtras;

  String get wrapperType => _wrapperType;
  String get kind => _kind;
  int get collectionId => _collectionId;
  int get trackId => _trackId;
  String get artistName => _artistName;
  String get collectionName => _collectionName;
  String get trackName => _trackName;
  String get collectionCensoredName => _collectionCensoredName;
  String get trackCensoredName => _trackCensoredName;
  int get collectionArtistId => _collectionArtistId;
  String get collectionArtistViewUrl => _collectionArtistViewUrl;
  String get collectionViewUrl => _collectionViewUrl;
  String get trackViewUrl => _trackViewUrl;
  String get previewUrl => _previewUrl;
  String get artworkUrl30 => _artworkUrl30;
  String get artworkUrl60 => _artworkUrl60;
  String get artworkUrl100 => _artworkUrl100;
  double get collectionPrice => _collectionPrice;
  double get trackPrice => _trackPrice;
  double get collectionHdPrice => _collectionHdPrice;
  double get trackHdPrice => _trackHdPrice;
  String get releaseDate => _releaseDate;
  String get collectionExplicitness => _collectionExplicitness;
  String get trackExplicitness => _trackExplicitness;
  int get discCount => _discCount;
  int get discNumber => _discNumber;
  int get trackCount => _trackCount;
  int get trackNumber => _trackNumber;
  int get trackTimeMillis => _trackTimeMillis;
  String get country => _country;
  String get currency => _currency;
  String get primaryGenreName => _primaryGenreName;
  String get contentAdvisoryRating => _contentAdvisoryRating;
  String get longDescription => _longDescription;
  bool get hasITunesExtras => _hasITunesExtras;

  Results(
      {String wrapperType,
      String kind,
      int collectionId,
      int trackId,
      String artistName,
      String collectionName,
      String trackName,
      String collectionCensoredName,
      String trackCensoredName,
      int collectionArtistId,
      String collectionArtistViewUrl,
      String collectionViewUrl,
      String trackViewUrl,
      String previewUrl,
      String artworkUrl30,
      String artworkUrl60,
      String artworkUrl100,
      double collectionPrice,
      double trackPrice,
      double collectionHdPrice,
      double trackHdPrice,
      String releaseDate,
      String collectionExplicitness,
      String trackExplicitness,
      int discCount,
      int discNumber,
      int trackCount,
      int trackNumber,
      int trackTimeMillis,
      String country,
      String currency,
      String primaryGenreName,
      String contentAdvisoryRating,
      String longDescription,
      bool hasITunesExtras}) {
    _wrapperType = wrapperType;
    _kind = kind;
    _collectionId = collectionId;
    _trackId = trackId;
    _artistName = artistName;
    _collectionName = collectionName;
    _trackName = trackName;
    _collectionCensoredName = collectionCensoredName;
    _trackCensoredName = trackCensoredName;
    _collectionArtistId = collectionArtistId;
    _collectionArtistViewUrl = collectionArtistViewUrl;
    _collectionViewUrl = collectionViewUrl;
    _trackViewUrl = trackViewUrl;
    _previewUrl = previewUrl;
    _artworkUrl30 = artworkUrl30;
    _artworkUrl60 = artworkUrl60;
    _artworkUrl100 = artworkUrl100;
    _collectionPrice = collectionPrice;
    _trackPrice = trackPrice;
    _collectionHdPrice = collectionHdPrice;
    _trackHdPrice = trackHdPrice;
    _releaseDate = releaseDate;
    _collectionExplicitness = collectionExplicitness;
    _trackExplicitness = trackExplicitness;
    _discCount = discCount;
    _discNumber = discNumber;
    _trackCount = trackCount;
    _trackNumber = trackNumber;
    _trackTimeMillis = trackTimeMillis;
    _country = country;
    _currency = currency;
    _primaryGenreName = primaryGenreName;
    _contentAdvisoryRating = contentAdvisoryRating;
    _longDescription = longDescription;
    _hasITunesExtras = hasITunesExtras;
  }

  Results.fromJson(dynamic json) {
    _wrapperType = json["wrapperType"];
    _kind = json["kind"];
    _collectionId = json["collectionId"];
    _trackId = json["trackId"];
    _artistName = json["artistName"];
    _collectionName = json["collectionName"];
    _trackName = json["trackName"];
    _collectionCensoredName = json["collectionCensoredName"];
    _trackCensoredName = json["trackCensoredName"];
    _collectionArtistId = json["collectionArtistId"];
    _collectionArtistViewUrl = json["collectionArtistViewUrl"];
    _collectionViewUrl = json["collectionViewUrl"];
    _trackViewUrl = json["trackViewUrl"];
    _previewUrl = json["previewUrl"];
    _artworkUrl30 = json["artworkUrl30"];
    _artworkUrl60 = json["artworkUrl60"];
    _artworkUrl100 = json["artworkUrl100"];
    _collectionPrice = json["collectionPrice"];
    _trackPrice = json["trackPrice"];
    _collectionHdPrice = json["collectionHdPrice"];
    _trackHdPrice = json["trackHdPrice"];
    _releaseDate = json["releaseDate"];
    _collectionExplicitness = json["collectionExplicitness"];
    _trackExplicitness = json["trackExplicitness"];
    _discCount = json["discCount"];
    _discNumber = json["discNumber"];
    _trackCount = json["trackCount"];
    _trackNumber = json["trackNumber"];
    _trackTimeMillis = json["trackTimeMillis"];
    _country = json["country"];
    _currency = json["currency"];
    _primaryGenreName = json["primaryGenreName"];
    _contentAdvisoryRating = json["contentAdvisoryRating"];
    _longDescription = json["longDescription"];
    _hasITunesExtras = json["hasITunesExtras"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["wrapperType"] = _wrapperType;
    map["kind"] = _kind;
    map["collectionId"] = _collectionId;
    map["trackId"] = _trackId;
    map["artistName"] = _artistName;
    map["collectionName"] = _collectionName;
    map["trackName"] = _trackName;
    map["collectionCensoredName"] = _collectionCensoredName;
    map["trackCensoredName"] = _trackCensoredName;
    map["collectionArtistId"] = _collectionArtistId;
    map["collectionArtistViewUrl"] = _collectionArtistViewUrl;
    map["collectionViewUrl"] = _collectionViewUrl;
    map["trackViewUrl"] = _trackViewUrl;
    map["previewUrl"] = _previewUrl;
    map["artworkUrl30"] = _artworkUrl30;
    map["artworkUrl60"] = _artworkUrl60;
    map["artworkUrl100"] = _artworkUrl100;
    map["collectionPrice"] = _collectionPrice;
    map["trackPrice"] = _trackPrice;
    map["collectionHdPrice"] = _collectionHdPrice;
    map["trackHdPrice"] = _trackHdPrice;
    map["releaseDate"] = _releaseDate;
    map["collectionExplicitness"] = _collectionExplicitness;
    map["trackExplicitness"] = _trackExplicitness;
    map["discCount"] = _discCount;
    map["discNumber"] = _discNumber;
    map["trackCount"] = _trackCount;
    map["trackNumber"] = _trackNumber;
    map["trackTimeMillis"] = _trackTimeMillis;
    map["country"] = _country;
    map["currency"] = _currency;
    map["primaryGenreName"] = _primaryGenreName;
    map["contentAdvisoryRating"] = _contentAdvisoryRating;
    map["longDescription"] = _longDescription;
    map["hasITunesExtras"] = _hasITunesExtras;
    return map;
  }
}
