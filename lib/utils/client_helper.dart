// ignore_for_file: constant_identifier_names, avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:collaborating_editing_app/utils/app_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class BaseClient {
  // final introdata = GetStorage();
  // final Logger log = Logger();

final String _stagingUrl = "http://10.0.2.2:6000/api/";
String get url => _stagingUrl;

  // String token = GetStorage().read('token');

  Map<String, String> get headers => {
        "Content-Type": "application/json",
      };

  String getToken() {
    return '';
  }


  //GET
  Future<dynamic> get(
    String api,
    {String? baseUrl}
    ) async {
    var uri = Uri.parse(baseUrl ?? url + api);

    try {
      var response = await http.get(uri, headers: headers);
      return  _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw AppException(
          'Apologies, an error occurred, please retry again', uri.toString());
    }
  }

  //POST
  Future<dynamic> post( String api, dynamic payloadObj,{String? baseUrl}
      ) async {
    var uri = Uri.parse(baseUrl ?? url + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http.post(uri, body: payload, headers: headers);
      return  _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw AppException(
          'Apologies, an error occurred, please retry again', uri.toString());
    }
  }

//put
  Future<dynamic> put(
    String baseUrl,
    String api,
    dynamic payloadObj, {
    bool isFormData = false,
    String? securePin,
  }) async {
    var uri = Uri.parse(baseUrl + api);
    var header = headers;
    var payload = isFormData ? payloadObj : json.encode(payloadObj);
    try {
      var response = await http.put(uri, body: payload, headers: header);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw AppException(
          'Apologies, an error occurred, please retry again', uri.toString());
    }
  }

  //DELETE
  Future<dynamic> delete(
    String baseUrl,
    String api,
    dynamic payloadObj,
  ) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http.delete(uri, body: payload, headers: headers);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw AppException(
          'Apologies, an error occurred, please retry again', uri.toString());
    }
  }


  dynamic _processResponse(http.Response response) {
    interceptResponse(response);
    if (response.statusCode >= 200 && response.statusCode <= 205) {
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      return responseJson;
    } else {
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      throw BadRequestException(
          responseJson['message'] ?? 'An error occured',
          );
    }
  }

  static interceptResponse(http.Response response) async {
    if (kDebugMode) {
      developer.log(response.request.toString());
      developer.log('''Response - ${response.statusCode}
          ${response.request!.url}''');
      developer.log(response.body.toString());
    }
  }
}
