import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';
import '../services/messages_service.dart';
import '../ui/screens/messages/components/message_tile.dart';

class MessagesController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // List<MessageSend> messagesSendList = [];
  RxList<MessageGet> conservationList = RxList([
  ]);

  @override
  Future<void> onInit() async {
    conservationList.value = await MessagesService().getAllConservations();
    if(conservationList.isEmpty) {
      conservationList.add(    MessageGet(id: 'cID', participant: Participant(id: 'pID', firstName: 'FirstName', lastName: 'LastName'), unreadCount: '3', message: 'Hello')
);
    }
    super.onInit();
  }

  


  // void sortByPinned() {
  //   for (var element in conservationList) {
  //     if (element.n) {
  //       messages.remove(element);
  //       messages.insert(0, element);
  //     }
  //   }
  // }
}