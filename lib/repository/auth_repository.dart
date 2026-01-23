import 'package:learning/data/network/base_api_service.dart';
import 'package:learning/data/network/network_api_service.dart';
import 'package:learning/res/app_urls.dart';

class AuthRepository{

  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> registerApi(dynamic data) async {
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrls.register, data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}