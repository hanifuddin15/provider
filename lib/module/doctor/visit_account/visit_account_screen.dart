import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/model/doctor/wallet_model/wallet_model.dart';
import 'package:kambaii_provider/module/doctor/visit_account/visit_account_controller.dart';

class VisitAccountScreen extends StatelessWidget {
  const VisitAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitAccountController>(
      init: VisitAccountController(),
      builder: (controller) {
        return Scaffold(

          backgroundColor: Colors.white,

          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(5),
                  child: Image.asset('images/kambaiilogo.png'))
            ],
            title: Text("${controller.doctorProfile.name}"),

          ),

          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomScrollView(
              slivers: [

                SliverToBoxAdapter(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey.withOpacity(0.4),
                              radius: Get.width*.12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${controller.walletModel!.lastWeek??"0"}", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  Text("Patients", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    fontSize: 11
                                  ),)
                                ],
                              ),
                            ),
                            SizedBox(height: 7,),
                            Text("Last Week", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 0.5
                            ),)
                          ],
                        ),

                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orangeAccent.withOpacity(0.4),

                              radius: Get.width*.12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${controller.walletModel!.last30Days??"0"}", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  Text("Patients", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 11
                                  ),)
                                ],
                              ),
                            ),

                            SizedBox(height: 7,),
                            Text("This Month", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 0.5
                            ),)
                          ],
                        ),

                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.redAccent.withOpacity(0.4),

                              radius: Get.width*.12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${controller.walletModel?.totalVisit??"0"}", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  Text("Patients", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 11
                                  ),)
                                ],
                              ),
                            ),

                            SizedBox(height: 7,),
                            Text("Till Date", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 0.5
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 20,),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(

                      color: Colors.grey.withOpacity(0.3)

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: (Get.width-20)*.15,
                          height: 30,
                          //color: Colors.black,

                          child: Center(
                            child: Text("SL NO", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis
                            ),),
                          ),
                        ),

                        Container(
                          width: (Get.width-20)*.55,
                          height: 30,
                          child: Center(
                            child: Text("Name", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis
                            ),),
                          ),
                        ),
                        Container(
                          width: (Get.width-20)*.3,
                          height: 30,
                          child: Center(
                            child: Text("Date", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis
                            ),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 10,),
                ),

                SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.walletModel?.lastVisitedPatients==null?0:controller.walletModel!.lastVisitedPatients!.length,
                            (context, index) {

                        LastVisitedPatients lp = controller.walletModel!.lastVisitedPatients![index];

                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(


                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                    width: (Get.width-20)*.15,
                                    height: 30,
                                    //color: Colors.black,

                                    child: Center(
                                      child: Text("${index+1}", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis
                                      ),),
                                    ),
                                  ),

                                  Container(
                                    width: (Get.width-20)*.55,
                                    height: 30,
                                    child: Center(
                                      child: Text("${lp.name??"--"}", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis
                                      ),),
                                    ),
                                  ),
                                  Container(
                                    width: (Get.width-20)*.3,
                                    height: 30,
                                    child: Center(
                                      child: Text("${lp.visitDate??"--"}", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis
                                      ),),
                                    ),
                                  ),



                                ],

                              ),

                              Divider(
                                color: Colors.black,
                              )
                            ],
                          ),
                        );

                    }
                    )
                )

              ],
            ),
          ),

        );
      }
    );
  }
}
