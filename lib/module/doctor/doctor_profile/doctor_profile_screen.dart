import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/doctor_change_password/change_password_screen.dart';
import 'package:kambaii_provider/module/doctor/doctor_profile/doctor_profile_screen_controller.dart';
import 'package:kambaii_provider/module/doctor/doctor_profile_update/doctor_profile_update_screen.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorProfileScreenController>(
      init: DoctorProfileScreenController(),
      builder: (controller) {
        return Scaffold(

          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("My Profile", ),
            // actions: [
            //   IconButton(onPressed: (){}, icon: SvgPicture.asset('images/logout.svg'))

            // ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      children: [

                        Container(
                          decoration: BoxDecoration(
                          ),
                          child: CircleAvatar(
                            radius: Get.width*.4*.5+5,
                            backgroundColor: Colors.greenAccent,
                            child: controller.doctorProfile.photo==null||controller.doctorProfile.photo!.isEmpty?CircleAvatar(
                              radius: Get.width*.4*.5,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset('images/avatar.svg', fit: BoxFit.cover,)

                            ):CircleAvatar(
                                radius: Get.width*.4*.5,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("${controller.doctorProfile.photo}"),

                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${controller.doctorProfile.name}", style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              letterSpacing: 1
                            ))
                          ],
                        ),

                        SizedBox(height: 30,),

                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/telephone.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile.mobile}", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),


                        SizedBox(height: 15,),


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/mail.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile.email}", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        SizedBox(height: 15,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/emergency.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile.emergencyContactNumber??"--"} (emergency)", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        SizedBox(height: 15,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/address.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile.address??"--"}", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        SizedBox(height: 15,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/gender.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile.gender??"--"}", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),
                        //SizedBox(height: 15,),

                        /*Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/zoom.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile} (zoom id)", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        SizedBox(height: 15,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: Image.asset('images/bmdc.png'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile} (BMDC)", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),*/
                        SizedBox(height: 15,),

                        Row(
                          children: [
                            ElevatedButton(onPressed: (){
                              Get.to(()=>ChangePasswordScreen());
                            }, child: Text('Change Password'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Get.back();
                }, child: Text("Back"), style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),),

                IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month, color: Colors.teal,)),

                ElevatedButton(onPressed: (){
                  Get.to(()=>DoctorProfileUpdateScreen());
                }, child: Text("Edit"), style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),)
              ],
            ),
          ),

        );
      }
    );
  }
}
