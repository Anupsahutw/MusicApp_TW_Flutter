import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutterapp/utilities/app_constants.dart';
import 'dart:convert';
import 'dart:async';
import 'app_exceptions.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

abstract class BaseHelper {
  Future<dynamic> get(String url) async {}
}

class ApiBaseHelper implements BaseHelper {
  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(AppConstants.baseUrl + url);
      print(response.request);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get received!');
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
