import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafemcepte/model/yiyecek_bilgi.dart';
import 'package:kafemcepte/service/yemek_storage_service.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class YiyecekEkleService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  YemekStorageServices _storageService = YemekStorageServices();

  String mediaUrl = '';
  var documentRef;
  //status eklemek için
  Future<YiyecekBilgi> yiyecekEkle(String isim,String kategori,bool stok_durumu,bool gluten_durumu,double fiyat,XFile pickedFile) async {
    var ref = _firestore.collection("Yiyecekler");
    if(pickedFile==null){
      mediaUrl="";
    }else{
      mediaUrl=await _storageService.resimYukleme(File(pickedFile.path));
    }
    documentRef= await ref.add({'isim': isim,'kategori':kategori,'stok_durumu':stok_durumu,'gluten_durumu':gluten_durumu, 'resim': mediaUrl,});

    return YiyecekBilgi(isim: isim,fiyat: fiyat,gluten_durumu: gluten_durumu,kategori: kategori,stok_durumu: stok_durumu,resim:mediaUrl);
  }

  //status göstermek için
  Stream<QuerySnapshot> yiyecekGetir() {
    var ref = _firestore.collection("Yiyecekler").snapshots();
    return ref;
  }

  //status silmek için
  Future<void> yiyecekSil(String docId) {
    var ref = _firestore.collection("Yiyecekler").doc(docId).delete();
    return ref;
  }
}