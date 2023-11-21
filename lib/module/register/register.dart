import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/login/login.dart';
import 'package:kambaii_provider/module/register/register_controller.dart';


import '../../core/utils/keys.dart';
import '../../core/values/colors.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller){
        return Scaffold(

          backgroundColor: Colors.white,

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
                        Text("Create New Account".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 24),),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(onPressed: (){
                          Get.offAll(()=>Login());
                        }, child: Text("Already Registered? Login".tr,)),
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
                      key: AppKeys.signupKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: controller.firstNameController,
                            validator: controller.validationFirstName,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onChanged: (value){
                              controller.firstName = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_outline),
                              labelText: 'First Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: controller.lastNameController,
                            validator: controller.validationLastName,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onChanged: (value){
                              controller.lastName = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_outline),
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: controller.mobileController,
                            validator: controller.validationMobile,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              controller.mobile = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.call),
                              labelText: 'Phone (username)',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            validator: controller.validationEmail,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
                              controller.email = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            validator: controller.validationPassword,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            inputFormatters: <TextInputFormatter>[
                              //FilteringTextInputFormatter.digitsOnly,

                            ],
                            onChanged: (value){
                              controller.password = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.vpn_key),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 16,
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
                              onPressed: (){
                                if (AppKeys.signupKey.currentState!.validate()) {
                                  AppKeys.signupKey.currentState!.save();
                                  // Get.offAllNamed(Routes.MAIN);
                                  controller.signup();
                                }
                              },
                              child: controller.isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                              ) : Text("Sing Up".tr,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
