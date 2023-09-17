import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, dynamic>> get(
      {required String url, @required String? token}) async {
    Map<String, String> headers = {};
    // headers.addAll({
    //   'Content-Type': 'application/json',
    // });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(
          'There is a issue with the status code ${response.statusCode}');
    }
  }

  static Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    // headers.addAll({
    //   'Content-Type': 'application/json',
    // });

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception('${data['message']}');
    }
  }

  static Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    // headers.addAll({
    //   'Content-Type': 'application/json',
    // });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a issue with the status code ${response.statusCode} with body ${response.body} ');
    }
  }
}
