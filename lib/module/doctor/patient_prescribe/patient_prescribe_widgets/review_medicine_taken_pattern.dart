import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_list_user.dart';

import '../patient_prescribe_controller.dart';

class ReviewMedicineTakenPattern extends StatelessWidget {
  const ReviewMedicineTakenPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(
            controller: controller.reviewMedicineTakenExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.tealAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
              ),


              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.userMedicineAllList.length,
                  itemBuilder: (context, index){

                  UserMedicine um = controller.userMedicineAllList[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                      ),
                      tileColor: Colors.tealAccent.withOpacity(0.3),


                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${um.medicineName}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),),
                          Text("${um.genericName}", // modified by hanif
                           style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),

                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${um.measurement} "),  //${um.measurementUnit} modified by hanif
                          //Text("${um.morning} ${um.afternoon} ${um.night}"), // modified by hanif
                         // Text("${um.morning  ?? 0} + ${um.afternoon ?? 0} + ${um.night ?? 0}") //modified  by hanif
                         Text("${um.morning == 'no' ? 0 : 1} + ${um.afternoon == 'no' ? 0 : 1} + ${um.night == 'no' ? 0 : 1}") //modified by hanif

                        ],
                      ),

                    ),
                  );

              })
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
                    Text("Review Medicine Taken Patterns", style: TextStyle(
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
