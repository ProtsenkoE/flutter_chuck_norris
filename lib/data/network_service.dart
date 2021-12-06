import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'model/models.dart';

class NetworkService {
  final String baseUrl;

  NetworkService(this.baseUrl);

  Future<JokeEntity> getRandomJoke() async {
    var url = Uri.https(baseUrl, '/jokes/random');

    var response = await http.get(
      url,
      headers: {"accept": "application/json"},
    );

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      return JokeEntity.fromMap(json);
    } else {
      debugPrint('${response.statusCode}');
      throw Exception(response.statusCode);
    }
  }
}
