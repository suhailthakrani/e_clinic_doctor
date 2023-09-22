

import 'package:e_clinic_dr/models/base_model.dart';

class UserModel extends BaseModel{

  String email = '';
  String pass = "";

  UserModel.empty();

  UserModel.fromJSON(Map<String,dynamic> json){
    // districts.clear();
    email = "${json["email"]??''}";
    pass = json["password"]??"";
  
  }


  Map<String,dynamic> toJson(){
    return {
      "email" : email,
      "password" : pass,
    };
  }


  @override
  String toString() {
    return 'UserModel{email: $email, password: $pass}';
  }
}