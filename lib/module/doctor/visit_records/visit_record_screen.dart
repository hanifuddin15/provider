import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/core/utils/webview_widgets.dart';
import 'package:kambaii_provider/model/visit_records/visit_records.dart';
import 'package:kambaii_provider/module/doctor/visit_records/visit_record_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VisitRecordScreen extends StatelessWidget {
  const VisitRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitRecordController>(
      init: VisitRecordController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.loading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text("Visit Records"),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18
              ),
              actions: [
                Container(
                  padding: EdgeInsets.all(7),
                  child: Image.asset('images/kambaiilogo.png'),

                )
              ],

            ),
            
            body: Padding(padding: EdgeInsets.all(10),
            
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text("Patient List"),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.visitRecords.length,
                            (context, index) {

                        VisitRecord vr = controller.visitRecords[index];

                        return ListTile(
                          onTap: (){
                            
                            Get.to(()=>Webviews(url: "https://kambaiihealth.com/prescription-view-for-app/${vr.prescriptionId}"));

                          },
                          tileColor: Colors.deepPurple.withOpacity(0.1),
                          title: Text("${vr.patientName}"),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        );

                    })
                )
              ],
            ),
            ),
          ),
        );
      }
    );
  }
}
