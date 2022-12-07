part of 'services.dart';

class MahasiswaService {
  static CollectionReference mhsColl =
      FirebaseFirestore.instance.collection("mahasiswa");
  static DocumentReference? mhsDoc;

  static Future<CollectionReference> getAllMahasiswa() async {
    var data = mhsColl;

    return data;
  }
}
