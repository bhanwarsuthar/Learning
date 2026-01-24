import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:learning/data/network/base_api_service.dart';

import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService{

  final http.Client client;

  NetworkApiService({http.Client? client}) : client = client ?? http.Client();

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try{
      final response =  await client.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try{
      final response = await client.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communicating with server with status code : ${response.statusCode}');
    }
  }
}