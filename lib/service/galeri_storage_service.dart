import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class GaleriStorageService{
  final FirebaseStorage firebaseStorage =FirebaseStorage.instance;
  Future<String> resimYukle(File file)async{
    var yuklemeYap=firebaseStorage.ref().child("Galeri/").child("${DateTime.now().microsecondsSinceEpoch}.${file.path.split('.').last}").putFile(file);
    yuklemeYap.snapshotEvents.listen((event) { });
    var galeriStorageRef=await yuklemeYap;
    return await galeriStorageRef.ref.getDownloadURL();
  }
}