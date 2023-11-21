import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen_controller.dart';
import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen_widget.dart';
import 'package:kambaii_provider/module/doctor/doctor_profile/doctor_profile_screen.dart';
import 'package:kambaii_provider/module/doctor/patient_schedule_list/patient_schedule_list_screen.dart';
import 'package:kambaii_provider/module/doctor/pharmacy_request/request_list_screen.dart';
import 'package:kambaii_provider/module/doctor/settings/settings_controller.dart';
import 'package:kambaii_provider/module/doctor/visit_records/visit_record_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../visit_account/visit_account_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsScreenController>(
        init: SettingsScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text("Settings", style: TextStyle(
                color: Colors.black,
              ),)

            ),
            body: CustomScrollView(
              slivers: [

                SliverToBoxAdapter(
                  child: Container(
                    child: TextButton(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text("Do you want to proceed?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {

                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("Cancel"),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                controller.showDialogOfCaching();


                              },
                              child: Text("Proceed"),
                            ),

                          ],
                        );
                      });
                    }, child: Text("Cache Necessary Element")
                    ),
                  ),
                )

              ],
            )
          );
        });
  }
}
