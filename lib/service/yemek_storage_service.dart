import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class YemekStorageServices{
  final FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  Future<String> resimYukleme(File file)async{
    var yuklemeYap=firebaseStorage.ref().child("Yiyecekler/").child(
        "${DateTime.now().microsecondsSinceEpoch}.${file.path.split('.').last}"
    ).putFile(file);

    yuklemeYap.snapshotEvents.listen((event) { });
    var yemekStorageRef =await yuklemeYap;

    return await yemekStorageRef.ref.getDownloadURL();
  }
}