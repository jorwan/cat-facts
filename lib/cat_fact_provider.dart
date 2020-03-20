import 'dart:convert';

import 'package:http/http.dart' as http;

class CatFactProvider {
  static final String factUrl = 'https://meowfacts.herokuapp.com/';

  static Future<String> getCatFact() async {
    String responseBody = '';
    String fact = '';

    // Catch any error from http request
    try {
      responseBody = await getCatFactFromAPI();
      fact = Fact.fromHttpResponse(responseBody).toString();
    } catch (e) {
      fact = 'Cat fact not found (Check your cat internet)';
    }
    return fact;
  }

  static Future<String> getCatFactFromAPI() async =>
      (await http.get(factUrl)).body;
}

class Fact {
  String fact;

  Fact.fromHttpResponse(String response) {
    var data = json.decode(response);
    this.fact = data['data'][0];
  }

  @override
  String toString() => fact;
}
