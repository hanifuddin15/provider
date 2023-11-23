

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/local_data/local_data.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:kambaii_provider/module/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/urls.dart';
import '../../../model/doctor/medicine/medicine_result.dart';

class DoctorHomeScreenController extends GetxController{
   static DoctorHomeScreenController get instance =>
      Get.find<DoctorHomeScreenController>();

  DoctorProfile doctorProfile = DoctorProfile();
  bool isLoading = false;

  LocalData localData = Get.find();

 void updateProfile(DoctorProfile updatedProfile) {
    doctorProfile = updatedProfile;
    update();
  }


  fetchProfile()async{
    try{
      LoginResult loginResult = Get.find();
      doctorProfile = loginResult.data!;
      update();
      print(loginResult.msg);
    }catch(e){
      await login();
      print("have to import");
    }

  }

  login()async{
    final uname = localData.username;
    final pass = localData.password;

    isLoading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl+Urls.login);

    try{
      var response = await post(url, body:
      {
        'username': uname,
        "password": pass
      },
          headers: {
            "Accept":"application/json"
          });

      var body = jsonDecode(response.body);
      print(body);


      if(response.statusCode==200){
        try{
          LoginResult loginResult = LoginResult.fromJson(jsonDecode(response.body));
          doctorProfile = loginResult.data!;

          isLoading = false;
          Get.put(doctorProfile);
          update();

        }catch(e){
          isLoading = false;
          update();
          Get.snackbar("Error", "${body["msg"]}");
          print(e);

        }
      }else{
        Get.snackbar("Error", body["msg"]);
      }

    }catch(e){
      isLoading = false;
      update();
      Get.snackbar("Error", "Server Error");
      print(e);

    }
    //01824713029
    //12345678
  }


  logout()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    Get.offAll(()=>Login());
  }
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProfile();
    super.onInit();
  }

}