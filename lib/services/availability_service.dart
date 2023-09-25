/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'package:e_clinic_dr/models/user_login_model.dart';
import 'package:e_clinic_dr/services/service_urls.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/common_code.dart';
import '../utils/user_session.dart';
import 'http_client.dart';

class AvailabilityService {
  static final AvailabilityService _instance = AvailabilityService._internal();
  AvailabilityService._internal() {
    _httpClient = HTTPClient();
  }
  factory AvailabilityService() => _instance;

  late HTTPClient _httpClient;

  Future addShedule({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kAddChargesURL,
        requestBody: /*TODO: */{},
        requireToken: false,);
    if (responseModel.message == "Success" && responseModel.data != null) {
     //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }

//TODO: Model Pass
  Future updateSchedule({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kUpdateChargesURL,
        requestBody: /*TODO: */{},
        requireToken: false,);
    if (responseModel.message == "Success" && responseModel.data != null) {
     //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }

}
