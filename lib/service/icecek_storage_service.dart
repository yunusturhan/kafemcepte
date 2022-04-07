import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class IcecekStorageServices{
  final FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  Future<String> resimYukleme(File file)async{
    var yuklemeYap=firebaseStorage.ref().child("Icecekler/").child(
        "${DateTime.now().microsecondsSinceEpoch}.${file.path.split('.').last}"
    ).putFile(file);

    yuklemeYap.snapshotEvents.listen((event) { });
    var icecekStorageRef =await yuklemeYap;

    return await icecekStorageRef.ref.getDownloadURL();
  }
}