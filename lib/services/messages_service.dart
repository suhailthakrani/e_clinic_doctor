import 'dart:developer';

import 'package:e_clinic_dr/services/http_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/message_model.dart';
import '../models/response_model.dart';
import '../utils/common_code.dart';
import 'service_urls.dart';

class MessagesService {

  static final MessagesService _instance = MessagesService._internal();

  factory MessagesService() => _instance;

  MessagesService._internal() {
    _httpClient = HTTPClient();
  }
  
  late HTTPClient _httpClient;

  Future<List<MessageGet>> getAllConservations() async {
  ResponseModel responseModel = await _httpClient.getRequest(url: '${kBaseURL}messages/conversations/list');
  List<MessageGet> messages = [];

  if (responseModel.message == "Success" &&
      responseModel.data != null &&
      responseModel.data is List) {
    List<dynamic> dataList = responseModel.data;

    for (var data in dataList) {
      messages.add(MessageGet.fromJson(data));
    }
  } else {
    CommonCode().showToast(message: responseModel.message);
  }

  return messages;
}

  Future<MessageSend> getConservationById(String id) async {
    ResponseModel responseModel = await _httpClient.getRequest(url: '${kBaseURL}messages/$id');
    MessageSend message = MessageSend.empty();
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data is Map) {
        return MessageSend.fromJson(responseModel.data);
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    return message;
  }
  

}
