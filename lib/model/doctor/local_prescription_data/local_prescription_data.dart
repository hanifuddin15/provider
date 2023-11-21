
import 'package:hive/hive.dart';
part 'local_prescription_data.g.dart';
@HiveType(typeId: 8)
class LocalPrescriptionData extends HiveObject{
  @HiveField(0)
  String? patientComplaints;
  @HiveField(1)
  String? chiefComplaints;
  @HiveField(2)
  String? dentalHealth;
  @HiveField(3)
  String? giveAdvicetoPateint;

  LocalPrescriptionData({
   this.giveAdvicetoPateint,
   this.chiefComplaints,
   this.dentalHealth,
   this.patientComplaints,

});
}