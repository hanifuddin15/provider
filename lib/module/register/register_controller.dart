import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/model/doctor/signup_model/signup_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/local_data/local_data.dart';
import '../../core/utils/urls.dart';
import '../../model/doctor/login_model/login_result_model.dart';
import '../doctor/doctor_home/doctor_home_screen.dart';


class SignupController extends GetxController {
  var isLoading = false;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String firstName = "";
  String lastName = "";
  String mobile = "";
  String email = "";
  String password = "";

  String? validationFirstName(String? value){
    if(value == null || value.isEmpty){
      return "Enter First Name";
    } else {
      return null;
    }
  }
  String? validationLastName(String? value){
    if(value == null || value.isEmpty){
      return "Enter Last Name";
    } else {
      return null;
    }
  }
  String? validationMobile(String? value){
    if(value == null || value.isEmpty){
      return "Enter Mobile Number";
    } else if(value.length < 10){
      return "Enter Valid Number";
    } else {
      return null;
    }
  }
  String? validationEmail(String? value){
    if(value == null || value.isEmpty){
      return "Enter Email";
    } else if(!GetUtils.isEmail(value)){
      return "Enter Valid Email";
    } else {
      return null;
    }
  }
  String? validationPassword(String? value){
    if(value == null || value.isEmpty){
      return "Enter Password";
    } else if(value.length < 5){
      return "Password too short";
    } else {
      return null;
    }
  }


  signup()async{
    isLoading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl+Urls.signup);

    try{
      var response = await post(url, body:
      {
        'firstname':firstNameController.text.trim(),
        'lastname':lastNameController.text.trim(),
        'mobile': mobileController.text.trim(),
        'password':passwordController.text.trim(),
        'type':'doctor',
        'is_external':"1",
        'email':emailController.text.trim()
      },
          headers: {
            "Accept":"application/json"
          });

      var body = jsonDecode(response.body);
      print(body);


      if(response.statusCode==200){
        try{
          SignupResult signupResult = SignupResult.fromJson(jsonDecode(response.body));
          //await setLocalData(loginResult.data!);
          await setLocalData(signupResult.data!);
          await login();
          isLoading = false;
          //Get.put(loginResult.data);
          update();

          Get.offAll(()=>DoctorHomeScreen());
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

  }

  setLocalData(SignupInfo signupInfo)async{

    LocalData localData = Get.find<LocalData>();
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    await localStorage.setString(LocalData.uname, signupInfo.username!);
    await localStorage.setString(LocalData.pwd, passwordController.value.text.trim());
    await localStorage.setBool(LocalData.ild, true);

    localData.username = signupInfo.username!;
    localData.password = passwordController.value.text.trim();
    localData.isLoggedIn = true;
    //Get.put(localData);

    update();
  }

  login()async{
    LocalData localData = Get.find();
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
          DoctorProfile doctorProfile = loginResult.data!;

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



}