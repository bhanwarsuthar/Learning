import 'package:learning/data/network/base_api_service.dart';
import 'package:learning/res/app_urls.dart';

class AuthRepository{

  final BaseApiService apiService;

  AuthRepository({required this.apiService});

  Future<dynamic> registerApi(dynamic data) async {
    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.register, data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}