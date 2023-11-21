import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/forgot_password/forgot_password_controller.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Container(

          padding: EdgeInsets.all(10),

          child: Column(
            children: [
              TextField(
                controller: controller.codeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(

                    labelText: 'Enter code',
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),

              SizedBox(height: 15,),

              TextField(
                controller: controller.newPasswordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(

                    labelText: 'Enter new password',
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: controller.confirmPasswordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(

                    labelText: 'Confirm password',
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),


            ],

          ),

        );
      }
    );
  }
}
