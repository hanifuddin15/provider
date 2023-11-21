import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/show_prescription_data_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../model/doctor/medicine/medicine_add.dart';
import '../../../model/doctor/medicine/medicine_list_user.dart';

class ShowPrescriptionData extends StatelessWidget {
  ShowPrescriptionData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowPrescribeDataController>(
      init: ShowPrescribeDataController(),
      builder: (controller) {
        return Scaffold(

          backgroundColor: Colors.white,

          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text("Prescription", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          ),
          body: ModalProgressHUD(
            inAsyncCall: controller.loading,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomScrollView(
                slivers: [

                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${controller.patientPrescribeController.doctorProfile.name}", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                              SizedBox(height: 10,),
                              Text("${controller.patientPrescribeController.doctorProfile.type}", style: TextStyle(

                                  fontSize: 16
                              ),),
                            ],
                          ),
                          Center(
                            child: Container(
                              width: 100,
                              child: Image.asset('images/kambaiilogo.png'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 20,),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.teal.withOpacity(0.4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Patient Name : ${controller.patientPrescribeController.patientsInfo.patientName}", style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("Reason : ${controller.patientPrescribeController.writePatientComplaintsController.text.trim()}", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("Gender : ${controller.patientPrescribeController.patientsInfo.userGender??"--"}", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("Age : ${controller.patientPrescribeController.patientsInfo.userAge??"--"}", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("Advice : ${controller.patientPrescribeController.giveAdviceToPatientController.text}", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 10,),
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.teal.withOpacity(0.4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PCP Note Summery", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("${controller.patientPrescribeController.writeChiefComplaintsController.text.trim()}", style: TextStyle(
                              fontSize: 15,

                            color: Colors.black
                          ),),
                          SizedBox(height: 20,),
                          Text("Patient's dental health", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("${controller.patientPrescribeController.patientDentalHealthController.text.trim()}", style: TextStyle(
                              fontSize: 15,

                              color: Colors.black
                          ),),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 10,),
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.teal.withOpacity(0.4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Provisional Diagnosis", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("${controller.patientPrescribeController.newDiagnosis.map((e) => e.provisinal_diagnosis).toString().replaceAll("(", "").replaceAll(")", "")}", style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),),
                          SizedBox(height: 10,),
                          Text("Reason : ${controller.patientPrescribeController.newDiagnosis.map((e) => e.provisinal_note).toString().replaceAll("(", "").replaceAll(")", "")}", style: TextStyle(
                              fontSize: 15,

                              color: Colors.black
                          ),),
                          SizedBox(height: 20,),
                          Text("Order Lab", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text("${controller.patientPrescribeController.newLabTests.map((e) => e.test_name).toString().replaceAll("(", "").replaceAll(")", "")}", style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),),
                          SizedBox(height: 10,),
                          Text("Reason : ${controller.patientPrescribeController.newLabTests.map((e) => e.reason).toString().replaceAll("(", "").replaceAll(")", "")}", style: TextStyle(
                              fontSize: 15,

                              color: Colors.black
                          ),),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 10,),
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.teal.withOpacity(0.4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("New Medicine", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          ListView.builder(
                              itemCount: controller.patientPrescribeController.allTheNewMedicine.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index){
                                MedicineAdded ma = controller.patientPrescribeController.allTheNewMedicine[index];
                                //print(ma.medicineTakeTime);
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                                  child: Stack(
                                    children: [

                                      ListTile(


                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${ma.medicineInfo!.brandName}'),
                                          ],
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${ma.medicineInfo!.strength}", style: TextStyle(
                                                    fontSize: 15
                                                ),),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("${ma.morning?"1":"0"}+${ma.noon?"1":"0"}+${ma.night?"1":"0"} (${ma.medicineIntakeMeal==0?"Before Meal":"After Meal"})"),
                                                Text("${ma.medicineInfo!.category}", style: TextStyle(
                                                    fontSize: 15
                                                ),)
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Text("${ma.reason}")


                                          ],
                                        ),
                                        tileColor: Colors.white,

                                      ),

                                    ],
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 10,),
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.tealAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.teal.withOpacity(0.4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Old Medicine", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          ListView.builder(
                              itemCount: controller.patientPrescribeController.userMedicineAllList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index){
                                UserMedicine um = controller.patientPrescribeController.userMedicineAllList[index];
                                //print(ma.medicineTakeTime);
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                                  child: Stack(
                                    children: [

                                      ListTile(
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
                                            Text("${um.genericName}", style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15
                                            ),),

                                          ],
                                        ),
                                        subtitle: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${um.measurement } "),
                                            Text("${um.morning == "no" ? 0 : 1} + ${um.afternoon == "no" ? 0 : 1} + ${um.night == "no" ? 0 : 1}")
                                          ],
                                        ),

                                      ),

                                    ],
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          bottomNavigationBar: Container(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){

              controller.submitData();

            }, child: Text("SUBMIT"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
          ),

        );
      }
    );
  }
}
