/*Created By: Suhail Thakrani on 23-Sept-2023*/


import 'package:e_clinic_dr/services/service_urls.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/user_session.dart';
import 'http_client.dart';

class UserService{

  static final UserService _instance = UserService._internal();
  UserService._internal(){
    _httpClient = HTTPClient();
  }
  factory UserService()=>_instance;

  late HTTPClient _httpClient;



  Future<UserModel> loginUser({required String username, required String password})async{
    UserModel user = UserModel.empty();
    ResponseModel responseModel = await _httpClient.postRequest(url: kLoginURL, requestBody: {'email': username, 'password':password},requireToken: false);
    if(responseModel.message=="Success" && responseModel.data != null && responseModel.data['token'] != null ){
      user = UserModel.fromJSON(responseModel.data['user']??{});
      UserSession().saveToken(token: TokenModel.fromString(responseModel.data['token']??''));
    } else{
      user.responseMessage = responseModel.message;
    }
    return user;
  }


}