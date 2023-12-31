import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen_controller.dart';
import 'package:kambaii_provider/module/doctor/doctor_profile_update/doctor_profile_update_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DoctorProfileUpdateScreen extends StatelessWidget {
  const DoctorProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorProfileUpdateController>(
      init: DoctorProfileUpdateController(),
      builder: (profileupdatecontroller) {
        return Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20
            ),
            title: Text("Profile Update"),
          ),
          body: ModalProgressHUD(
            inAsyncCall: profileupdatecontroller.loading,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("First Name", style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.firstnameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your first name',
                              filled: true,
                              suffixIcon: Icon(Icons.drive_file_rename_outline),
                              fillColor: Colors.grey.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                          SizedBox(height: 20,),

                          Text("Last Name", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.lastnameController,
                            decoration: InputDecoration(
                                hintText: 'Enter your last name',
                                filled: true,
                                suffixIcon: Icon(Icons.drive_file_rename_outline),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),



                          Text("Phone", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(

                                hintText: 'Enter your phone number',
                                filled: true,
                                suffixIcon: Icon(Icons.phone),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),


                          Text("Email", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Enter your email',
                                filled: true,
                                suffixIcon: Icon(Icons.email),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),

                          Text("Address", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(

                            controller: profileupdatecontroller.addressController,

                            decoration: InputDecoration(
                                hintText: 'Enter your address',
                                filled: true,
                                suffixIcon: Icon(Icons.location_on),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Emergency contact number", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.emergencycontactController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: 'Your emergency contact number',
                                filled: true,

                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),


                          Text("Gender", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          ListTile(
                            onTap: (){
                              profileupdatecontroller.changeGender(0);
                            },
                            title: Text("Male", style: TextStyle(fontWeight: FontWeight.bold),),
                            leading: profileupdatecontroller.gender==0?Icon(Icons.done_all, color: Colors.green,):Icon(Icons.circle_outlined),
                          ),
                          ListTile(
                            onTap: (){
                              profileupdatecontroller.changeGender(1);
                            },
                            title: Text("Female", style: TextStyle(fontWeight: FontWeight.bold),),
                            leading: profileupdatecontroller.gender==1?Icon(Icons.done_all, color: Colors.green,):Icon(Icons.circle_outlined),
                          ),
                          SizedBox(height: 20,),
                          //developed by Hanif

                          
                          Text("Date of Birth", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(

                            controller: profileupdatecontroller.dateofBirthController,

                            decoration: InputDecoration(
                                hintText: 'Your Date of Birth',
                                filled: true,

                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),
                          //end

                          Text("Age", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(

                            controller: profileupdatecontroller.ageController,

                            decoration: InputDecoration(
                                hintText: 'Your age',
                                filled: true,

                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Zoom Id", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),

                          TextField(

                            controller: profileupdatecontroller.zoomIdController,

                            decoration: InputDecoration(
                                hintText: 'Enter your zoom id',
                                filled: true,

                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Zoom Password", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(

                            controller: profileupdatecontroller.zoomPasswordController,

                            decoration: InputDecoration(
                                hintText: 'Enter your zoom password',
                                filled: true,

                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),

                          Text("MLN", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.bmdcController,

                            decoration: InputDecoration(
                                hintText: 'Enter your bmdc certificate number',
                                filled: true,

                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),

                          Row(
                            children: [
                              Text("Profile Image : ", style: TextStyle(fontWeight: FontWeight.bold),),
                              ElevatedButton(onPressed: (){
                                profileupdatecontroller.chooseImage(context, true);
                              }, child: Text("Select Image"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
                              SizedBox(width: 10,),
                              if(profileupdatecontroller.profileImage!=null)
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: FileImage(File(profileupdatecontroller.profileImage!.path)),
                                    radius: 40,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: IconButton(onPressed: (){
                                            profileupdatecontroller.deleteProfileImage();

                                          }, icon: Icon(Icons.delete_forever, color: Colors.white,)),

                                        )
                                      ],
                                    ),
                                  ),
                                )

                            ],
                          ),


                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("MLN certificate : ", style: TextStyle(fontWeight: FontWeight.bold),),
                              ElevatedButton(onPressed: (){
                                profileupdatecontroller.chooseImage(context, false);

                              }, child: Text("Select Image"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),

                              SizedBox(width: 10,),
                              if(profileupdatecontroller.bmdcImage!=null)
                                Container(
                                  height: 70,
                                  width: 70,

                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: FileImage(File(profileupdatecontroller.bmdcImage!.path)))
                                  ),

                                  child: Stack(
                                    children: [
                                      Center(
                                        child: IconButton(onPressed: (){

                                          profileupdatecontroller.deleteBmdcImage();

                                        }, icon: Icon(Icons.delete_forever, color: Colors.white,)),

                                      )
                                    ],
                                  ),
                                )

                            ],
                          ),
                          SizedBox(height: 20,),
                         Container(
                           width: double.infinity,
                           child: ElevatedButton(onPressed: (){
                             profileupdatecontroller.updateProfile();
 Get.find<DoctorProfileUpdateController>().updateProfile();
                             //by hanif
                              DoctorHomeScreenController.instance
                                .fetchProfile();
                           }, child: Text("Update"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
                         )
                        ],
                      ),
                    ),


                  ),
                )
              ],
            ),
          ),

        );
      }
    );
  }
}
