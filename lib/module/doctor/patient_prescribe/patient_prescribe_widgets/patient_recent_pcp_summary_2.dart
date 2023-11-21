import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/core/utils/webview_widgets.dart';
import 'package:kambaii_provider/model/doctor/patient_info/patient_prescription_info.dart';
import 'package:kambaii_provider/model/patient_visit_summary/patient_all_visit_summary_model.dart';

import '../patient_prescribe_controller.dart';

class PatientRecentPCPSummary2 extends StatelessWidget {
  PatientRecentPCPSummary2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(

            controller: controller.patientRecentPcpSummaryExpandableController2,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.patientsVisitInfo.length,
                  itemBuilder: (context, index){

                  PatientVisitInfo pvsi = controller.patientsVisitInfo[index];

                    return Container(

                      margin: EdgeInsets.only(bottom: 10),

                      child: ListTile(
                        tileColor: Colors.tealAccent.withOpacity(0.1),
                        contentPadding: EdgeInsets.all(10),
                        title: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Text("Provider : ${pvsi.dname??"--"}", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("Type : ${pvsi.type??"--"}", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),
                                ],
                              ),
                              Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${pvsi.tds}", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),
                                 GestureDetector(

                                     onTap: () {
                                       
                                       Get.to(()=>Webviews(url: pvsi.button!));

                                     },
                                     child: Text("View Details", style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.blue
                                     ),)
                                 )

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }
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
                    Text("Patient Recent PCP Summary", style: TextStyle(
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
