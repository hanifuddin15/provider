import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/forgot_password/find_number.dart';
import 'package:kambaii_provider/module/forgot_password/forgot_password_controller.dart';
import 'package:kambaii_provider/module/forgot_password/update_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (controller) {
        return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: controller.loading,
              child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: Get.width*.4,
                            width: Get.width*.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('images/kambaiilogo.png'))
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        if(controller.phoneScreen)
                          FindNumber()
                        else
                          UpdatePasswordScreen()
                        /*Expanded(
                          child: TabBarView(
                              children: [

                              ]
                          ),
                        ),*/
                      ],
                    ),
                  )
              ),
            ),
            bottomNavigationBar: Container(
              width: Get.width,
              child: controller.phoneScreen?ElevatedButton(onPressed: (){

                if(controller.phoneController.text.isEmpty){
                  Get.showSnackbar(GetSnackBar(
                    title: 'Error',
                    message: 'Enter valid phone number',
                    duration: Duration(seconds: 3),
                  ));
                }else{
                  controller.findPhone();
                }

              }, child: Text("Find your account"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal
                ),
              ):ElevatedButton(onPressed: (){

                controller.updatePassword();

              }, child: Text("Update")),
            ),
          );
      }
    );
  }
}
