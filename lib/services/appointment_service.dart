/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'package:e_clinic_dr/models/user_login_model.dart';
import 'package:e_clinic_dr/services/service_urls.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/common_code.dart';
import '../utils/user_session.dart';
import 'http_client.dart';

class AppointmentService {
  static final AppointmentService _instance = AppointmentService._internal();
  AppointmentService._internal() {
    _httpClient = HTTPClient();
  }
  factory AppointmentService() => _instance;

  late HTTPClient _httpClient;

   Future getAppointmentsList() async {

    ResponseModel responseModel = await _httpClient.getRequest(url: kGetAppointmentsURL);
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  } Future getRequestedAppointmentsList() async {

    ResponseModel responseModel = await _httpClient.getRequest(url: kGetAppointmentRequestsURL);
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }
   Future getCompletedAppointmentsList() async {

    ResponseModel responseModel = await _httpClient.getRequest(url: kGetCompletedAppointmentsURL);
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }

  Future acceptAppointmentRequestByID({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kAcceptAppointmentURL,
        requestBody: {'appointmentId': appointmentId},
        requireToken: false,);
    if (responseModel.message == "Success" && responseModel.data != null) {
     //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }
  Future rejectAppointmentRequestByID({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kRejectAppointmentURL,
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
  Future prescribeAppointmentRequestByID({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kAddPrescriptionURL,
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
