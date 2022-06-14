import 'package:cloud_firestore/cloud_firestore.dart';

class YiyecekBilgi {
  String kategori, isim,aciklama;
  bool gluten_durumu, stok_durumu;
  double fiyat;
  String resim;

  YiyecekBilgi(
      {
      required this.kategori,
      required this.isim,
      required this.gluten_durumu,
      required this.stok_durumu,
        required this.aciklama,
      required this.fiyat, required this.resim});

  factory YiyecekBilgi.fromSnapshot(DocumentSnapshot snapshot) {
    return YiyecekBilgi(
        kategori: snapshot["kategori"],
        isim: snapshot["isim"],
        gluten_durumu: snapshot["gluten_durumu"],
        stok_durumu: snapshot["stok_durumu"],
        aciklama: snapshot["aciklama"],
        fiyat: snapshot["fiyat"],
        resim: snapshot["resim"]);
  }
}
