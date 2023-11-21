import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_controller.dart';

class ShowInputScreen extends StatelessWidget {
  ShowInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [

              Row(
                children: [
                  Text("KAMBAII", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),)

                ],
              )

            ],
          ),
        );
      }
    );
  }
}
