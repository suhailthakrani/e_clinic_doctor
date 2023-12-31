import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/me_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';

class UserSession {
  static final RxBool isDataChanged = RxBool(false);
  static final Rx<UserModel> userModel = UserModel.empty().obs;
  static RxString role = ''.obs;

  static final UserSession _instance = UserSession._internal();
  UserSession._internal();
  factory UserSession() {
    return _instance;
  }

  

  Future<bool> createSession({required UserModel user}) async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = user;
    preference.setString('USER_DATA', jsonEncode(userModel.value.toJson()));
    return true;
  }

  Future<bool> isUserLoggedIn() async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = UserModel.fromJson(
        jsonDecode(preference.getString('USER_DATA') ?? "{}"));
    return !userModel.value.email.isNotEmpty;
  }

  Future<bool> logout() async {
    final preference = await SharedPreferences.getInstance();
    preference.remove('USER_DATA');
    return true;
  }

  Future<void> saveToken({required TokenModel token}) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString("token", jsonEncode(token.forSession()));
  }

  Future<TokenModel> getToken() async {
    final preference = await SharedPreferences.getInstance();
    final value = jsonDecode(preference.getString('token') ?? '{}');
    final TokenModel token = TokenModel.fromSession(value);
    return token;
  }

   
  Future<void> saveMe({required MeModel me}) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString("me", jsonEncode(me.toJson()));
  }
  Future<MeModel> getMe() async {
    final preference = await SharedPreferences.getInstance();
    Map<String, dynamic> name = jsonDecode((preference.getString("me")??'{}'));
    return MeModel.fromJson(name);

  }
}
