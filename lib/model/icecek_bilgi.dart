import 'package:cloud_firestore/cloud_firestore.dart';

class IcecekBilgi {
  String kategori, isim;
  bool alkol_durumu, stok_durumu;
  double fiyat;
  String resim;

  IcecekBilgi(
      {
        required this.kategori,
        required this.isim,
        required this.alkol_durumu,
        required this.stok_durumu,
        required this.fiyat, required this.resim});

  factory IcecekBilgi.fromSnapshot(DocumentSnapshot snapshot) {
    return IcecekBilgi(
        kategori: snapshot["kategori"],
        isim: snapshot["isim"],
        alkol_durumu: snapshot["alkol_durumu"],
        stok_durumu: snapshot["stok_durumu"],
        fiyat: snapshot["fiyat"]
        ,
        resim: snapshot["resim"]);
  }
}
