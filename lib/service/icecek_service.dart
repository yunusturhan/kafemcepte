import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafemcepte/model/icecek_bilgi.dart';
import 'package:kafemcepte/model/yiyecek_bilgi.dart';
import 'package:kafemcepte/service/icecek_storage_service.dart';
import 'package:kafemcepte/service/yemek_storage_service.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class IcecekEkleService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  IcecekStorageServices _storageService = IcecekStorageServices();

  String mediaUrl = '';
  var documentRef;
  //status eklemek için
  Future<IcecekBilgi> icecekEkle(String isim,String kategori,bool stok_durumu,bool alkol_durumu,double fiyat,XFile pickedFile) async {
    var ref = _firestore.collection("Icecekler");
    if(pickedFile==null){
      mediaUrl="";
    }else{
      mediaUrl=await _storageService.resimYukleme(File(pickedFile.path));
    }
    documentRef= await ref.add({'isim': isim,'kategori':kategori,'stok_durumu':stok_durumu,'alkol_durumu':alkol_durumu, 'resim': mediaUrl,'fiyat':fiyat});

    return IcecekBilgi(kategori: kategori, isim: isim, alkol_durumu: alkol_durumu, stok_durumu: stok_durumu, fiyat: fiyat, resim: mediaUrl);
  }

  //status göstermek için
  Stream<QuerySnapshot> icecekGetir() {
    var ref = _firestore.collection("Icecekler").snapshots();
    return ref;
  }

  //status silmek için
  Future<void> icecekSil(String docId) {
    var ref = _firestore.collection("Icecekler").doc(docId).delete();
    return ref;
  }
}