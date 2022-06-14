import 'package:cloud_firestore/cloud_firestore.dart';

class GaleriBilgi{
  String resim;

  GaleriBilgi({
    required this.resim
});

  factory GaleriBilgi.fromSnapshot(DocumentSnapshot snapshot){
    return GaleriBilgi(resim: snapshot["resim"]);
  }
}