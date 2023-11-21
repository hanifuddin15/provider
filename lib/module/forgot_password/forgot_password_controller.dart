import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/utils/urls.dart';

class ForgotPasswordController extends GetxController{

  bool loading = false;

  String userId = "";

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  bool phoneScreen = true;

  changePhoneScreen(bool s){
    phoneScreen = s;
    update();
  }

  findPhone()async{
    loading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl+Urls.match_mobile);
    try{
      var response = await post(
          url,
          body: {
            'username':phoneController.text.trim()
      },
        headers: {
          "Accept": "application/json",

        }
      );
      loading = false;
      update();
      if(response.statusCode==200){
        var responseBody = jsonDecode(response.body);
        if(responseBody["error"]==false){
          userId = responseBody['data']['userid'].toString();
          phoneScreen = false;
          update();
          Get.showSnackbar(GetSnackBar(
            title: 'Success',
            message: responseBody["msg"],
            duration: Duration(seconds: 3),
          ));
        }else{
          Get.showSnackbar(GetSnackBar(
            title: 'Error',
            message: responseBody["msg"],
            duration: Duration(seconds: 3),
          ));
        }

      }else{
        var responseBody = jsonDecode(response.body);

        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: responseBody["msg"],
          duration: Duration(seconds: 3),
        ));
      }
    }catch(e){
      print(e);
      loading = false;
      update();
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Check Network',
        duration: Duration(seconds: 3),
      ));
    }
  }
  
  updatePassword()async{
    
    if(codeController.text.isEmpty||newPasswordController.text.isEmpty){
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Fields must be filled',
      ));
      return;
    }
    if(newPasswordController.text!=confirmPasswordController.text){
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Confirm password is not matching',
      ));
      return;
    }
    
    loading = true;
    update();
    
    Uri url = Uri.parse(Urls.baseUrl+Urls.update_password);

    try{

      var response = await post(
          url,
        body: {
          'userid': userId,
          'password': newPasswordController.text.trim(),
          'otp': codeController.text.trim(),
        },
          headers: {
            "Accept": "application/json",
          }
      );

      loading = false;
      update();
      var responseBody = jsonDecode(response.body);

      if(response.statusCode==200){

        if(responseBody["error"]==false){

          Get.back();
          Get.showSnackbar(
              GetSnackBar(
                title: 'Success',
                message: '${responseBody["msg"]}',
                duration: Duration(seconds: 3),
              )
          );

        }else{
          Get.showSnackbar(
              GetSnackBar(
                title: 'Error',
                message: '${responseBody["msg"]}',
                duration: Duration(seconds: 3),
              )
          );
        }

      }else{
        Get.showSnackbar(
            GetSnackBar(
              title: 'Error',
              message: '${responseBody["msg"]}',
              duration: Duration(seconds: 3),
            )
        );
      }

    }catch(e){
      loading = false;
      update();
      print(e);
      Get.showSnackbar(
          GetSnackBar(
            title: 'Error',
            message: 'Check network status',
            duration: Duration(seconds: 3),
          )
      );

    }
    
  }



}