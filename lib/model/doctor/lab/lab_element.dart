
import 'package:hive/hive.dart';
part 'lab_element.g.dart';

@HiveType(typeId: 9)
class AddLabTest extends HiveObject{
  @HiveField(0)
  String user_id;
  @HiveField(1)
  String specelist_id;
  @HiveField(2)
  String test_name;
  @HiveField(3)
  String? reason;
  @HiveField(4)
  String visit_id;
  AddLabTest({required this.test_name, this.reason, required this.user_id, required this.specelist_id, required this.visit_id});
}

@HiveType(typeId: 10)
class Diagnosis extends HiveObject{
  @HiveField(0)
  String? doctor_id;
  @HiveField(1)
  String? patient_id;
  @HiveField(2)
  String? provisinal_note;
  @HiveField(3)
  String? provisinal_diagnosis;
  @HiveField(4)
  String? visit_id;
  Diagnosis({this.doctor_id, this.patient_id, this.provisinal_note, this.provisinal_diagnosis, this.visit_id});
}