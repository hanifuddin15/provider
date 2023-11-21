
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_add.dart';

import '../../../../model/doctor/medicine/medicine_result.dart';
import '../patient_prescribe_controller.dart';

class PatientRegularMedicinePatterns extends StatelessWidget {
  const PatientRegularMedicinePatterns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(
            controller: controller.patientRegularMedicinePatternExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1)
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TypeAheadField(

                          textFieldConfiguration: TextFieldConfiguration(
                              controller: controller.medicineNameTradeController,
                              autofocus: false,

                              style: DefaultTextStyle.of(context).style.copyWith(
                                  fontStyle: FontStyle.italic
                              ),
                              decoration: InputDecoration(
                                labelText: 'Search Medicine',
                                  border: OutlineInputBorder()
                              )
                          ),
                          transitionBuilder: (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          suggestionsCallback: (pattern) async {
                            print(pattern);
                            await controller.searchMedicine(pattern);
                            return controller.medicines;
                          },
                          itemBuilder: (context, MedicineInfo suggestion) {
                            return ListTile(
                              leading: const Icon(Icons.medical_services_outlined,size: 20,),
                              title: Text('${suggestion.brandName}'),
                            );
                          },
                          onSuggestionSelected: (MedicineInfo suggestion) {
                            //controller.medicineNameTradeController.text = suggestion;
                            controller.updateSelectedMedicine(suggestion);
                          },
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                autofocus: false,

                                controller: controller.typeOfMedicineController,

                                decoration: InputDecoration(
                                  labelText: "Type",
                                  border: OutlineInputBorder()
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextField(
                                autofocus: false,
                                controller: controller.medicineNameGenericController,
                                decoration: InputDecoration(
                                  labelText: "Generic Name",
                                    border: OutlineInputBorder()
                                ),
                              ),
                            )

                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                autofocus: false,
                                controller: controller.medicineStrengthController,

                                decoration: InputDecoration(
                                    labelText: "mg/ml",
                                    border: OutlineInputBorder()
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextField(
                                autofocus: false,
                                controller: controller.numofdaystotakemedicineController,
                                decoration: InputDecoration(
                                    labelText: "Days",
                                    border: OutlineInputBorder()
                                ),
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          autofocus: false,
                          controller: controller.howMuchTotakemedicineController,
                          decoration: InputDecoration(
                              labelText: "Amount",
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.medicineIntakeTime.length,
                                  itemBuilder: (context, index){

                                  return ListTile(
                                    onTap: (){
                                      controller.medicineIntakeTimeIndexUpdate(index);
                                    },
                                    leading: controller.medicineIntakeTimeIndex.contains(index)?Icon(Icons.done_all, color: Colors.green,):Icon(Icons.check_box_outline_blank),
                                    title: Text("${controller.medicineIntakeTime[index]}"),
                                  );
                                  }
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.medicineIntakeFood.length,

                                      itemBuilder: (context, index){
                                        return ListTile(
                                          onTap: (){
                                            controller.medicineIntakeFoodIndexUpdate(index);
                                          },
                                          leading: controller.medicineIntakeIndex==index?Icon(Icons.check_box, color: Colors.green,):Icon(Icons.check_box_outline_blank),
                                          title: Text("${controller.medicineIntakeFood[index]}"),
                                        );
                                      }
                                  ),
                                  //Divider(),
                                  ListTile(

                                    onTap: (){
                                      controller.changeContinued();
                                    },

                                    leading: controller.continued?Icon(Icons.check_box,color: Colors.green,):Icon(Icons.check_box_outline_blank),
                                    title: Text("Continue"),

                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        /*SizedBox(height: 10,),
                        Text('Status'),

                        ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ListTile(
                              leading: Icon(Icons.check_box_outline_blank),
                              title: Text("Continue"),
                            ),
                            ListTile(
                              leading: Icon(Icons.check_box_outline_blank),
                              title: Text("Discontinue"),
                            ),
                          ],
                        ),*/

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.remarks,

                                decoration: InputDecoration(
                                    labelText: "Remarks",
                                    border: OutlineInputBorder()
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextField(
                                controller: controller.reason,
                                decoration: InputDecoration(
                                    labelText: "Reason for this medicine",
                                    border: OutlineInputBorder()
                                ),
                              ),
                            )

                          ],
                        ),

                        SizedBox(height: 10,),
                        ElevatedButton(onPressed: (){

                          controller.regularMedicineAdd();

                        }, child: Text("Add")
                        )

                      ],

                    ),

                  ),

                  SizedBox(height: 10,),

                  Container(

                    decoration: BoxDecoration(),
                    child: ListView.builder(
                      itemCount: controller.regularMedicinesAdded.length,
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                        MedicineAdded ma = controller.regularMedicinesAdded[index];
                        //print(ma.medicineTakeTime);
                        return Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent.withOpacity(0.1)
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
                              ),
                              Align(
                                child: GestureDetector(
                                    child: Icon(Icons.delete_forever, color: Colors.red,),
                                  onTap: (){
                                      controller.deleteRegularMedicine(index);
                                  },
                                ),
                                alignment: Alignment.topRight,
                              )
                            ],
                          ),
                        );
                        }
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
                    Text("Patient Regular Medicine Taking Patterns", style: TextStyle(
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
