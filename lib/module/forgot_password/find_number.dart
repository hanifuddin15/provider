import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/forgot_password/forgot_password_controller.dart';

class FindNumber extends StatelessWidget {
  FindNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Container(

          padding: EdgeInsets.all(10),

          child: Column(
            children: [
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(

                  labelText: 'Enter your phone number',
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  suffixIcon: Icon(Icons.call, color: Colors.teal,),
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
