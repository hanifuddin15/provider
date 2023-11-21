import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/local_data/local_data.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController{

  bool loading = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  LocalData localData = Get.find();
  DoctorProfile doctorProfile = Get.find();

  bool checkValidPass(){
    if(newPasswordController.text.isEmpty){
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Please enter new password',
        duration: Duration(seconds: 3),
      ));
      return false;
    }
    if(newPasswordController.text != confirmNewPasswordController.text){
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: "Confirm password didn't match",
        duration: Duration(seconds: 3),
      ));
      return false;
    }
    return true;
  }

  changePassword()async{

    loading = true;
    update();

    Uri url = Uri.parse(Urls.baseUrl+Urls.profile_update);

    try{
      var response = await post(
        url,
        body:{
          'user_id': doctorProfile.id.toString(),
          'password': newPasswordController.text.trim(),
        },
        headers:{
          //'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${localData.token}',
        },
      );

      if(response.statusCode==200){

        await setLocalData();
        Get.back();
        Get.showSnackbar(GetSnackBar(
          title: 'Success',
          message: 'Your password is changed successfully',
          duration: Duration(
            seconds: 2
          ),
        ));


      }else{
        try{
          Get.showSnackbar(GetSnackBar(
            title: 'Error',
            message: "${jsonDecode(response.body)['msg']}",
            duration: Duration(
                seconds: 2
            ),
          ));
        }catch(e){
          Get.showSnackbar(GetSnackBar(
            title: 'Error',
            message: "Invalid credentials",
            duration: Duration(
                seconds: 2
            ),
          ));
        }

      }
      print(response.body);
      loading = false;
      update();

    }catch(e){
      print(e);
      loading = false;
      update();
    }
  }

  setLocalData()async{

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString(LocalData.pwd, newPasswordController.text.trim());
    await localStorage.setBool(LocalData.ild, true);
    localData.password = newPasswordController.text.trim();
    Get.put(localData);

    update();
  }



}