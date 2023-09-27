/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'dart:convert';
import 'dart:io';

import 'package:e_clinic_dr/models/user_login_model.dart';
import 'package:e_clinic_dr/services/service_urls.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/user_session.dart';
import 'http_client.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  UserService._internal() {
    _httpClient = HTTPClient();
  }
  factory UserService() => _instance;

  late HTTPClient _httpClient;

  Future<UserModel> registerUser({required UserModel userModel}) async {
    File imageFile = File(userModel.degreeDocument);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    Map<String, String> files = {
      'image': userModel.degreeDocument,
    };
    userModel.degreeDocument = base64Image;

    // ResponseModel responseModel = await _httpClient.postRequest(
    //   url:kRegisterURL,
    //   requestBody : userModel.toJson(),
    //   requireToken: true
    // );
    
    ResponseModel responseModel = await _httpClient.postMultipartRequest(
      url:kRegisterURL,
      fields : userModel.toJson(),
      files: files
    );

    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data['token'] != null) {
      UserSession().createSession(user: userModel);
      // user = UserModel.fromJson(responseModel.data['user'] ?? {});
      UserSession().saveToken(
          token: TokenModel.fromString(responseModel.data['token'] ?? ''));
    } else {
      userModel.responseMessage = responseModel.message;
    }
    return userModel;
  }

  Future<UserModel> loginUser(
      {required String username, required String password}) async {
    UserModel user = UserModel.empty();
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kLoginURL,
        requestBody: {'email': username, 'password': password},
        requireToken: false);
    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data['token'] != null) {
      user = UserModel.fromJson(responseModel.data['user'] ?? {});
      UserSession().saveToken(
          token: TokenModel.fromString(responseModel.data['token'] ?? ''));
    } else {
      user.responseMessage = responseModel.message;
    }
    return user;
  }
}
