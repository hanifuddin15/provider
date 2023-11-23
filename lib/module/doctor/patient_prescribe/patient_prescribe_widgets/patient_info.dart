import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utils/urls.dart';

class PatientInfo extends StatelessWidget {
  PatientInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text("Patient Information", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16
                  ),),
                ),
              ),

              SizedBox(height: 10,),

              Center(
                child: Container(
                  padding: EdgeInsets.all(3),
                  height: Get.width*.4,
                  width: Get.width*.4,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.withOpacity(0.5)

                  ),
                  child: 
                  ClipRRect(
  child: controller.patientsInfo.userPhoto != null
      ? CachedNetworkImage(
          imageUrl:
              // "${Urls.picBaseUrl}profile_pic/${controller.patientsInfo.userPhoto}",
              "${controller.patientsInfo.userPhoto}",
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
      : SvgPicture.asset('images/avatar.svg'),
  borderRadius: BorderRadius.circular(10),
),

                  // ClipRRect(
                  //     child: controller.patientsInfo.userPhoto!=null? 
                  //     (Image.network("${Urls.picBaseUrl}profile_pic/${controller.patientsInfo.userPhoto}", fit: BoxFit.cover,)):SvgPicture.asset('images/avatar.svg'),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),

                ),
              ),

              SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.tealAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.teal)
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Patient Name : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),),

                        SizedBox(height: 10,),


                        Text("MRN : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Age : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Gender : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Mobile : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Height : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Text("Weight : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Doctor Assign : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Doctor BMDC : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Schedule Date : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Schedule Time : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Visit Id : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Status : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Meet Connect : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Reason : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Address : ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                      ],
                    ),

                    SizedBox(width: 10,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${controller.patientsInfo.patientName??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("PAT${controller.patientsInfo.mrn??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.userAge??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.userGender??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.userMobile??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.height??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Text("${controller.patientsInfo.weight??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),


                        Text("${controller.patientsInfo.doctorName??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.doctorBmdc??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.sheduleDate??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.scheduleTime??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.visitId??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.status??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Container(
                          width: Get.width*.4,
                          child: Text("${controller.patientsInfo.meetingUrl??"--"}", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15,
                            overflow: TextOverflow.ellipsis
                          ),),
                        ),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.reason??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("${controller.patientsInfo.address??"--"}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ],
                ),
              )


            ],
          ),
        );
      }
    );
  }
}
