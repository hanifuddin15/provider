import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:kambaii_provider/core/utils/webview_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../patient_prescribe_controller.dart';

class PatientMedicalHistory extends StatelessWidget {
  PatientMedicalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return InkWell(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return Webviews(url: controller.medicalHistoryUrl);
                  }
              );
            },
            child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Patient Medical History", style: TextStyle(
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

          /*ExpandablePanel(
            controller: controller.patientMedicalHistoryExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              padding: EdgeInsets.all(10),
              height: Get.height*3,
              child: WebViewWidget(controller: controller.webViewController,),
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
                    Text("Patient Medical History", style: TextStyle(
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
          );*/
        }
    );
  }
}
