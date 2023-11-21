import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/doctor_change_password/change_password_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) {
        return Scaffold(

          backgroundColor: Colors.white,

          body: ModalProgressHUD(
            inAsyncCall: controller.loading,
            child: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                      padding: EdgeInsets.all(20),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            height: Get.width*.35,
                            width: Get.width*.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('images/kambaiilogo.png',))
                            ),

                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Center(
                            child: Text("Change Password", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: 23
                            ),),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextField(

                            controller: controller.newPasswordController,

                            decoration: InputDecoration(
                              labelText: 'New password',
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.1),
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(15)

                              )
                            ),

                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(

                            controller: controller.confirmNewPasswordController,

                            decoration: InputDecoration(
                                labelText: 'Confirm new password',
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(15)

                                )
                            ),

                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Container(
                            width: Get.width,
                            child: ElevatedButton(onPressed: (){

                              if(controller.checkValidPass()){
                                controller.changePassword();
                              }

                            }, child: Text("Change", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal
                            ),
                            ),
                          )


                        ],
                      )
                    )
                  )
                ],
              ),
            ),
          ),


        );
      }
    );
  }
}
