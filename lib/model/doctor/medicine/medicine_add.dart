import 'package:hive/hive.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_result.dart';
part 'medicine_add.g.dart';
@HiveType(typeId: 11)
class MedicineAdded extends HiveObject{
  @HiveField(1)
  MedicineInfo? medicineInfo;
  @HiveField(2)
  List<int> medicineTakeTime;
  @HiveField(3)
  bool morning = false;
  @HiveField(4)
  bool noon = false;
  @HiveField(5)
  bool night = false;
  @HiveField(6)
  String days;
  @HiveField(7)
  int? medicineIntakeMeal = 1;
  @HiveField(8)
  String amount;
  @HiveField(9)
  String? reason = "";
  @HiveField(10)
  String? remarks = "";
  @HiveField(11)
  bool continued;
  MedicineAdded({this.medicineInfo, this.medicineIntakeMeal, required this.medicineTakeTime, this.reason, this.remarks, required this.morning, required this.night, required this.noon, required this.days, required this.amount, required this.continued});

}