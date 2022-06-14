import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kafemcepte/service/galeri_service.dart';
class GaleriResimYonetim extends StatefulWidget {
  const GaleriResimYonetim({Key? key}) : super(key: key);

  @override
  State<GaleriResimYonetim> createState() => _GaleriResimYonetimState();
}

class _GaleriResimYonetimState extends State<GaleriResimYonetim> {
  GaleriService _galeriService =GaleriService();


  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var urunImage;
  Widget imagePlace(){
    double height=MediaQuery.of(context).size.height;
    if(urunImage!=null){
      return CircleAvatar(
          backgroundImage: FileImage(File(urunImage!.path)),
          radius: height*0.12
      );
    }
    else{
      if(_pickImage!=null){
        return CircleAvatar(
            backgroundImage: NetworkImage(_pickImage),
            radius: height*0.12
        );
      }else{
        return CircleAvatar(
          backgroundImage: const AssetImage("assets/images/logo.png"),
          radius: height*0.12,
        );
      }
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeri Resim Ayarları"),

      ),body: Center(
      child: Column(
        children: [
          Center(child: imagePlace(),),
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,children: [
              InkWell(
                child: Icon(Icons.camera_alt,size: 48,),onTap: ()=>_onImageButtonPressed(ImageSource.camera,context: context),
              ),
              InkWell(
                child: Icon(Icons.image,size: 48,),onTap: ()=>_onImageButtonPressed(ImageSource.gallery,context: context),
              )
            ],),
          ElevatedButton.icon(onPressed: (){
            _galeriService.galeriResimEkle(urunImage);
            Fluttertoast.showToast(msg: "Ürün Başarıyla Eklendi");

          }, icon: Icon(Icons.add_a_photo_outlined), label: Text("Resim Ekle"))
        ],
      ),
    ),
    );
  }



  void _onImageButtonPressed(ImageSource source,
      {required BuildContext context}) async {
    try {
      final pickedFile = await _pickerImage.pickImage(source: source,maxHeight: 300,maxWidth:
      300,imageQuality: 50);
      setState(() {
        urunImage = pickedFile!;
        print("dosyaya geldim: $urunImage");
        if (urunImage != null) {}
      });
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Image Error: " + _pickImage);
      });
    }
  }

}
