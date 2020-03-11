import 'dart:convert';

import 'package:http/http.dart';

class CoronaVirusTracker {
  static String baseUrl = 'https://coronavirus-tracker-api.herokuapp.com';

  static Future<Map> getAll() async {
    final String endpoint = '/all';
    final String fullEndpoint = baseUrl + endpoint;
    Response response = await get(fullEndpoint);
    
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      Map data = jsonDecode(response.body);

      return data;
    }

  }
}