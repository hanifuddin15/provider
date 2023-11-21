import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/lab_report/lab_report_model.dart';

import '../patient_prescribe_controller.dart';

class PatientPreviousLabReports extends StatelessWidget {
  PatientPreviousLabReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(

            controller: controller.patientPreviousLabReportExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              //margin: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              height: 160,

              child: ListView.builder(
                itemCount: controller.labreportImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){

                  LabImages lm = controller.labreportImages[index];

                    return Container(
                      width: 160,
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.only(right: 10),
                      child: FullScreenWidget(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                             // child: Image.network("${Urls.picBaseUrl+lm.img!}", fit: BoxFit.cover,),
                            child: Image.network("${lm.img!}", fit: BoxFit.cover,),
                            ),
                          )
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
                    Text("Patient Previous Lab Reports", style: TextStyle(
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
