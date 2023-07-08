// ignore_for_file: public_member_api_docs, sort_constructors_first
class MusicModel {
  final List<Music> music;
  MusicModel({
    required this.music,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
      music: List<Music>.from(
          (json['results'] as List).map((e) => Music.fromJson(e))));
}

class Music {
  final String img;
  final String trackName;
  final String trackCollectionName;
  final String description;
  final String shortDescription;
  final String artisit;
  final String gener;

  Music(
      {required this.img,
      required this.trackName,
      required this.trackCollectionName,
      required this.description,
      required this.shortDescription,
      required this.gener,
      required this.artisit});

  factory Music.fromJson(Map<String, dynamic> json) => Music(
      img: json['artworkUrl60'] ?? "",
      artisit: json['artistName'] ?? "",
      trackName: json['trackName'] ?? "",
      trackCollectionName: json['collectionName'] ?? "",
      description: json['longDescription'] ?? "",
      gener: json['primaryGenreName'] ?? "",
      shortDescription: json['shortDescription'] ?? "");
}


// {
//       "wrapperType": "track",
//       "kind": "feature-movie",
//       "collectionId": 1682076357,
//       "trackId": 928911988,
//       "artistName": "Chad Stahelski",
//       "collectionName": "John Wick 4-Film Collection",
//       "trackName": "John Wick",
//       "collectionCensoredName": "John Wick 4-Film Collection",
//       "trackCensoredName": "John Wick",
//       "collectionArtistId": 345356312,
//       "collectionArtistViewUrl": "https://itunes.apple.com/us/artist/lions-gate-films-inc/345356312?uo=4",
//       "collectionViewUrl": "https://itunes.apple.com/us/movie/john-wick/id928911988?uo=4",
//       "trackViewUrl": "https://itunes.apple.com/us/movie/john-wick/id928911988?uo=4",
//       "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video122/v4/96/40/21/9640214a-4056-bfcc-96d8-d81572e05082/mzvf_1990167584366328854.640x350.h264lc.U.p.m4v",
//       "artworkUrl30": "https://is2-ssl.mzstatic.com/image/thumb/Video122/v4/2d/1f/3f/2d1f3f7f-e11b-4f1c-3a82-e3ae35b16ef5/pr_source.jpg/30x30bb.jpg",
//       "artworkUrl60": "https://is2-ssl.mzstatic.com/image/thumb/Video122/v4/2d/1f/3f/2d1f3f7f-e11b-4f1c-3a82-e3ae35b16ef5/pr_source.jpg/60x60bb.jpg",
//       "artworkUrl100": "https://is2-ssl.mzstatic.com/image/thumb/Video122/v4/2d/1f/3f/2d1f3f7f-e11b-4f1c-3a82-e3ae35b16ef5/pr_source.jpg/100x100bb.jpg",
//       "collectionPrice": 34.99,
//       "trackPrice": 14.99,
//       "trackRentalPrice": 3.99,
//       "collectionHdPrice": 34.99,
//       "trackHdPrice": 14.99,
//       "trackHdRentalPrice": 3.99,
//       "releaseDate": "2014-10-24T07:00:00Z",
//       "collectionExplicitness": "notExplicit",
//       "trackExplicitness": "notExplicit",
//       "trackCount": 4,
//       "trackNumber": 1,
//       "trackTimeMillis": 6072065,
//       "country": "USA",
//       "currency": "USD",
//       "primaryGenreName": "Action & Adventure",
//       "contentAdvisoryRating": "R",
//       "shortDescription": "When sadistic young thugs senselessly attack John Wick (Keanu Reeves)—a brilliantly lethal ex-",
//       "longDescription": "When sadistic young thugs senselessly attack John Wick (Keanu Reeves)—a brilliantly lethal ex-assassin—they have no idea they've messed with the wrong guy. With New York City as his bullet-riddled playground, Wick embarks on a merciless rampage, hunting down his adversaries with the skill and ruthlessness that made him an underworld legend.",
//       "hasITunesExtras": true
//     },