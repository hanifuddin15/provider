import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../patient_prescribe_controller.dart';

class GivePatientAdvice extends StatelessWidget {
  GivePatientAdvice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(
            controller: controller.giveAdviceToPatientExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(2),
              child: Column(
                children: [

                  SizedBox(height: 10,),
                  TextField(
                    controller: controller.giveAdviceToPatientController,
                    maxLines: null, //by hanif
                    onChanged: (s) {
                      controller.changeAdvicetoPatient(s);
                    },
                    decoration: InputDecoration(
                                            suffixIcon: IconButton(onPressed: (){
                          controller.eraseAdvicetoPatient();
                        }, icon: Icon(Icons.delete_forever, color: Colors.red,)),
                        
                      labelText: "Doctor's Advice",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                      
                    ),
                  )
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
                    Text("Give Advice to patient", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),),
                    //if(controller.patientDentalHealth.isNotEmpty)
                    if(controller.giveAdvicetoPateint.isNotEmpty)
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
