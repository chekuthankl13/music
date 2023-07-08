import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music/models/music_model.dart';

class ApiRepository {
  var client = http.Client();

  getMusic() async {
    try {
      var res = await client
          .get(Uri.parse("https://itunes.apple.com/search?term=John"));
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        return {"status": "ok", "data": MusicModel.fromJson(body)};
      } else {
        return {"status": "failed", "message": "!200"};
      }
    } catch (e) {
      return {"status": "failed", "message": "some server error occured"};
    }
  }
}
