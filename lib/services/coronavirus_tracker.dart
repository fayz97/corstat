import 'dart:convert';

import 'package:http/http.dart';

class CoronaVirusTracker {
  static String baseUrl = 'https://coronavirus-tracker-api.herokuapp.com';

  static Future<Map> getAll() async {
    final String endpoint = '/all';
    final String fullEndpoint = baseUrl + endpoint;
    Response response = await get(fullEndpoint);
    
    return processResponse(response);
  }

  static Future<Map> getConfirmed() async {
    final String endpoint = '/confirmed';
    final String fullEndpoint = baseUrl + endpoint;
    Response response = await get(fullEndpoint);

    return processResponse(response);
  }

  static Future<Map> getDeaths() async {
    final String endpoint = '/deaths';
    final String fullEndpoint = baseUrl + endpoint;
    Response response = await get(fullEndpoint);

    return processResponse(response);
  }

  static Future<Map> getRecovered() async {
    final String endpoint = '/recovered';
    final String fullEndpoint = baseUrl + endpoint;
    Response response = await get(fullEndpoint);

    return processResponse(response);
  }

  static Map processResponse(Response response) {
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      Map data = jsonDecode(response.body);

      return data;
    }
  }
}