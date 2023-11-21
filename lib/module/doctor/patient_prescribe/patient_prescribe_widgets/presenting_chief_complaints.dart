import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../patient_prescribe_controller.dart';

class PresentingChiefComplaints extends StatelessWidget {
  PresentingChiefComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(

            controller: controller.presentingChiefsComplaintsExpandableController,

              collapsed: SizedBox.shrink(),
              expanded: Container(
                padding: EdgeInsets.all(10),
                child: Column(

                  children: [
                    TextField(
                      controller: controller.writeChiefComplaintsController,
                      maxLines: null,
                      onChanged: (s){
                        controller.changeChiefPatientComplaint(s);
                      },

                      decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            controller.eraseChiefPatientComplaints();
                          }, icon: Icon(Icons.delete_forever, color: Colors.red,)),
                          labelText: 'Write patient Chief Complaints',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),

                    SizedBox(height: 5,),
                    Text("Please read it back to the patient and ensure that the information you input is accurate.", style: TextStyle(
                      color: Colors.red,

                    ),),

                    SizedBox(height: 10,),


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
                      Text("Presenting Chief Complaints", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      if(controller.writeChiefComplaint.isNotEmpty)
                        Icon(Icons.done, color: Colors.white,)
                      else
                        Icon(Icons.add_circle_outline_outlined, color: Colors.white,)
                    ],
                  )
              ),
            );
        }
    );
  }
}
