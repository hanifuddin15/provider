import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_controller.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/add_view_patient_order_lab_test.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/give_medicine_for_patient_rx.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/give_patient_advice.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_dental_health.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_info.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_medical_history_info.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_previous_lab_reports.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_previous_prescriptions.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_provisional_diagnosis.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_recent_pcp_summary.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_recent_pcp_summary_2.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_regular_medicine_patterns.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/patient_vital_data.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/presenting_chief_complaints.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/previous_assigned_doctor_info.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/review_medicine_taken_pattern.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/show_input_screen.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_widgets/write_patient_complaints.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PatientPrescribeScreen extends StatelessWidget {
  PatientPrescribeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return GetBuilder<PatientPrescribeController>(
      init: PatientPrescribeController(),
      builder: (controller) {
        return DefaultTabController(
          length: 5,
          child: ModalProgressHUD(
            inAsyncCall: controller.loading,
            child: Scaffold(

              backgroundColor: Colors.white,
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  FloatingActionButton(onPressed:controller.tabController.index==4?(){
                    controller.addAllTheNewMedicine();
                    controller.showPrescriptionFormat(context);
                  }:(){
                    controller.changeTabs();

                  }, child: Text(controller.tabController.index==4?"Show":"Next", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),), backgroundColor: Colors.teal, )
                ],
              ),


              appBar: AppBar(
                title: Text("Prepare Patient Presription"),
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                elevation: 0,

              ),
              body: Column(
                children: [
                  TabBar(
                    controller: controller.tabController,
                      tabs: [
                        Tab(
                          child: Text("Step 1", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                        Tab(
                          child: Text("Step 2", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                        Tab(
                          child: Text("Step 3", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                        Tab(
                          child: Text("Step 4", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                        Tab(
                          child: Text("Step 5", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),

                      ]
                  ),

                  Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                          children: [
                        ListView(
                          children: [
                            PatientInfo()
                          ],
                        ),

                        ListView(
                          children: [
                            WritePatientComplaints(),
                            PresentingChiefComplaints(),
                            PatientDentalHealth(),
                            PatientMedicalHistory(),
                          ],
                        ),

                        ListView(
                          children: [
                            PatientVitalData(),
                            PatientPreviousLabReports(),
                            PatientPreviousPrescriptions(),
                            //PatientRecentPCPSummary(),
                            PatientRecentPCPSummary2()
                          ],
                        ),

                        ListView(
                          children: [
                            AddViewPatientOrderLabTest(),
                            PatientProvisionalDiagnosis(),
                            ReviewMedicineTakenPattern(),
                            PatientRegularMedicinePatterns(),
                            GiveMedicineForPatientRx()

                          ],
                        ),

                        ListView(
                          children: [
                            GivePatientAdvice()

                          ],
                        ),


                      ])
                  )
                ],
              )
              /*CustomScrollView(
                slivers: [

                  SliverToBoxAdapter(
                    child: PatientInfo(),
                  ),

                  SliverToBoxAdapter(
                    child: WritePatientComplaints(),
                  ),

                  SliverToBoxAdapter(
                    child: PresentingChiefComplaints(),
                  ),

                  SliverToBoxAdapter(
                    child: PatientDentalHealth(),
                  ),

                  SliverToBoxAdapter(
                    child: PatientMedicalHistory(),
                  ),
                  SliverToBoxAdapter(
                    child: PatientVitalData(),
                  ),
                  SliverToBoxAdapter(
                    child: PatientPreviousLabReports(),
                  ),
                  SliverToBoxAdapter(
                    child: PatientPreviousPrescriptions(),
                  ),

                  SliverToBoxAdapter(
                    child: PatientRecentPCPSummary(),
                  ),
                  SliverToBoxAdapter(
                    child: AddViewPatientOrderLabTest(),
                  ),

                  SliverToBoxAdapter(
                    child: PatientProvisionalDiagnosis(),
                  ),

                ],
              ),*/

            ),
          ),
        );
      }
    );
  }
}
