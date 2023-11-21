import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kambaii_provider/module/forgot_password/forgot_password_screen.dart';
import 'package:kambaii_provider/module/register/register.dart';

import '../../core/utils/keys.dart';
import '../../core/values/colors.dart';
import '../doctor/doctor_home/doctor_home_screen.dart';
import 'login_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                        //color: AppColors.mainColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Image(
                          image: AssetImage("images/kambaiilogo.png"),
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("Kambaii Health".tr,
                          style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.w500,fontSize: 24,
                            letterSpacing: 1.5
                          ),),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Sign In To Continue".tr,
                          style: TextStyle(color: Colors.black87,
                              fontWeight: FontWeight.normal,fontSize: 14),),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  sliver: SliverToBoxAdapter(
                    child: Form(
                      key: AppKeys.loginKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: controller.userController,
                            keyboardType: TextInputType.phone,
                            validator: controller.validationUser,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){
                              controller.user = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_outline),
                              labelText: 'Mobile (username)',
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(color: Colors.black, width: 2)

                              ),
                              /*enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                              ),*/
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.passwordController,
                            validator: controller.validationPassword,
                            textInputAction: TextInputAction.done,
                            onChanged: (value){
                              controller.password = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.vpn_key_rounded),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(color: Colors.black, width: 2)
                              )
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 30,),
                            decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),primary: AppColors.mainColor),
                              onPressed: ()async{
                                if (AppKeys.loginKey.currentState!.validate()) {
                                  AppKeys.loginKey.currentState!.save();
                                  await controller.login();
                                }
                              },
                              child: controller.isLoading ? ColorfulCircularProgressIndicator(colors: [
                                Colors.blue, Colors.red, Colors.green, Colors.yellow
                              ]) : Text("Login".tr,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextButton(onPressed: (){
                            Get.to(()=>ForgotPasswordScreen());
                          }, child: Text("Forgot Password".tr,)),

                          TextButton(onPressed: (){
                            Get.offAll(()=>Signup());
                          }, child: Text("Don't have account? Register".tr,),),

                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
