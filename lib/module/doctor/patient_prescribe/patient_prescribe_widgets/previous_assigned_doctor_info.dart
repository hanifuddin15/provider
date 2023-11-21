import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_controller.dart';

class PreviousAssignedDoctor extends StatelessWidget {
  PreviousAssignedDoctor({Key? key, required this.controller}) : super(key: key);
  PatientPrescribeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ExpandablePanel(

        expanded: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

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
                        Text("Sifat Alam", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("PAT-978947", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("24", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Male", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("01927126428", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("5", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Text("90", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                        SizedBox(height: 10,),

                        Text("Madina market, Sylhet", style: TextStyle(
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
        ), header: Container(
        margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(5)
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Previously Assigned Doctor", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16
              ),),
              Icon(Icons.remove_red_eye_rounded, color: Colors.white,)
            ],
          )
      ),
        collapsed: SizedBox.shrink(),
        theme: ExpandableThemeData(
          hasIcon: false,
          alignment: Alignment.center


        ),

      ),
    );
  }
}
