import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../patient_prescribe_controller.dart';

class PatientVitalData extends StatelessWidget {
  PatientVitalData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(
            controller: controller.patientRecentHealthDataExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              margin: EdgeInsets.all(10),
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
                      Text("Systolic : ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),

                      SizedBox(height: 10,),


                      Text("Diastolic : ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("Pulse : ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("Temperature : ", style: TextStyle(
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

                      Text("Auto BMI : ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("Sugar Reading : ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("Sleeps : ", style: TextStyle(
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
                      Text("${controller.vitalInfo.systolic??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),

                      SizedBox(height: 10,),


                      Text("${controller.vitalInfo.diastolic??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("${controller.vitalInfo.pulse??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("${controller.vitalInfo.temperatureReading??"--"} ${controller.vitalInfo.temperatureUnit??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("${controller.vitalInfo.height??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),
                      Text("${controller.vitalInfo.weightReading??"--"} ${controller.vitalInfo.weightUnit??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("${controller.patientsInfo.bmi??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("${controller.vitalInfo.sugarReading??"--"} ${controller.vitalInfo.sugarUnit??"--"}", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),

                      Text("${controller.vitalInfo.sleeps??"--"} Hours/day", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                      SizedBox(height: 10,),
                    ],
                  ),
                ],
              ),
            ),
            theme: ExpandableThemeData(
                hasIcon: false,
                alignment: Alignment.center


            ),
            header: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Patient Recent Health Vital Data", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),),
                    if(controller.patientDentalHealth.isNotEmpty)
                      Icon(Icons.remove_red_eye, color: Colors.white,)
                    else
                      Icon(Icons.remove_red_eye, color: Colors.white,)
                  ],
                )
            ),
          );
        }
    );
  }
}
