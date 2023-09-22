

import 'package:e_clinic_dr/models/base_model.dart';

class UserModel extends BaseModel{
  String id = '';
  String name = "";
  String email = "";
  String groupId = "";
  String districtId = "";
  // List<DistrictModel> districts = [];
  // List<TalukaModel> talukas = [];

  UserModel.empty();

  UserModel.fromJSON(Map<String,dynamic> json){
    // districts.clear();
    id = "${json["id"]??''}";
    name = json["name"]??"";
    email = json["email"]??"";
    groupId = '${json["group_id"]??""}';
    districtId = json["district_id"]??"";
    // for(var d in json['districts']??[]){
    //   districts.add(DistrictModel.fromJson(d));
    // }
    // for(var t in json['talukas']??[]){
    //   talukas.add(TalukaModel.fromJson(t));
    // }
  }


  Map<String,dynamic> toJson(){
    return {
      "id" : id,
      "name" : name,
      "email" : email,
      "group_id" : groupId,
      "district_id" : districtId,
      // 'districts':districts.map((e) => e.toJson()).toList(),
      // 'talukas':talukas.map((e) => e.toJson()).toList(),
    };
  }

  bool get isEmpty {
    return id.isEmpty;
  }

  // List<TalukaModel> getTalukaByDistrictId(String dId){
  //   return talukas.where((element) => element.districtId == dId).toList();
  // }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, groupId: $groupId, districtId: $districtId}';
  }
}