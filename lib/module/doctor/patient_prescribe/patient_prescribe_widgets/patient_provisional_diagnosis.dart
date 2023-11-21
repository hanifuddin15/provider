import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../patient_prescribe_controller.dart';

class PatientProvisionalDiagnosis extends StatelessWidget {
  PatientProvisionalDiagnosis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(

            controller: controller.patientProvisionalExpandableController,
            collapsed: SizedBox.shrink(),
            expanded: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Text("Diagnosis Name", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 5,),

                  TypeAheadField(

                    textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.diagnosisnameController,
                        autofocus: false,

                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontStyle: FontStyle.italic
                        ),
                        decoration: InputDecoration(
                            labelText: 'Diagnosis name',
                            border: OutlineInputBorder()
                        )
                    ),
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    suggestionsCallback: (pattern) async {
                      print(pattern);
                      //controller.searchLabTestByString(pattern);
                      return controller.allDiagnosisName.data!.where((element) => element.toLowerCase().contains(pattern.toLowerCase())).toList();
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        leading: const Icon(Icons.medical_services_outlined,size: 20,),
                        title: Text('${suggestion}'),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      //controller.medicineNameTradeController.text = suggestion;
                      controller.updateDiagnosis(suggestion);
                    },
                  ),
                  SizedBox(height: 10,),

                  Center(
                    child: Text("Diagnosis Reason", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 5,),

                  TextField(
                    controller: controller.diagnosisreasonController,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: 'Diagnosis Reason',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 10,),

                  ElevatedButton(onPressed: (){

                    controller.addDiagnosis();

                  }, child: Text("Add")
                  ),

                  SizedBox(height: 20,),

                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.diagnosis.length,
                      itemBuilder: (context, index){

                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${controller.diagnosis[index].provisinal_diagnosis}", style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),


                              IconButton(onPressed: (){

                              }, icon: Icon(Icons.delete_forever, color: Colors.red,))


                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("${controller.diagnosis[index].provisinal_note}"),
                              Text("${DateFormat.yMd().format(DateTime.now())}"),


                            ],
                          ),
                        );

                      }
                  ),

                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.newDiagnosis.length,
                      itemBuilder: (context, index){

                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${controller.newDiagnosis[index].provisinal_diagnosis}", style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),


                              IconButton(onPressed: (){
                                controller.deleteDiagnosis(index);
                              }, icon: Icon(Icons.delete_forever, color: Colors.red,))

                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("${controller.newDiagnosis[index].provisinal_note}"),
                              Text("${DateFormat.yMd().format(DateTime.now())}"),


                            ],
                          ),
                        );

                      }
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
                    Text("Patient Provisional Diagnosis", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),),
                    if(controller.newDiagnosis.isEmpty)
                      Icon(Icons.add_circle_outline_outlined, color: Colors.white,)
                    else
                      Icon(Icons.done, color: Colors.white,)
                  ],
                )
            ),
          );
        }
    );
  }
}
