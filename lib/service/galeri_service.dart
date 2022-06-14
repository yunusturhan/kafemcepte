import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafemcepte/model/galeri_bilgi.dart';
import 'package:kafemcepte/service/galeri_storage_service.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class GaleriService{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  GaleriStorageService  _galeriStorageService=GaleriStorageService();
  String mediaUrl=" ";
  var documentRef;

  Future<GaleriBilgi> galeriResimEkle(XFile pickedFile) async {
    var ref = _firestore.collection("Galeri");
    if(pickedFile==null){
      mediaUrl="";
    }else{
      mediaUrl=await _galeriStorageService.resimYukle(File(pickedFile.path));
    }
    documentRef= await ref.add({'resim': mediaUrl});

    return GaleriBilgi(resim: mediaUrl);
  }

}
