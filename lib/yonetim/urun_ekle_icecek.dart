import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kafemcepte/service/icecek_service.dart';
class UrunEkleIcecekSayfasi extends StatefulWidget {
  const UrunEkleIcecekSayfasi({Key? key}) : super(key: key);

  @override
  State<UrunEkleIcecekSayfasi> createState() => _UrunEkleIcecekSayfasiState();
}

class _UrunEkleIcecekSayfasiState extends State<UrunEkleIcecekSayfasi> {
  final kategoriList=['Çay','Meyve Suyu','Gazlı İçecek','Alkollü İçecek','Sıcak Kahve','Soğuk Kahve'];
  final fiyatTL=[
    for(int i=0;i<100;i++) "$i"
  ];
  String? secilenKategori,secilenTL,secilenKrs;
  bool durumStok=false,durumAlkol=false;
  IcecekEkleService _icecekEkleService=IcecekEkleService();



  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var urunImage;
  TextEditingController _urunAdiController= TextEditingController();


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
        title: const Center(child: Text("İÇECEK EKLE",style: TextStyle(color: Colors.white),),),
        actions: [Container()],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
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

              DropdownButton(
                isExpanded: true,
                value: secilenKategori,
                icon:const  Icon(Icons.keyboard_arrow_down),
                items:kategoriList.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items)
                  );
                }
                ).toList(),
                onChanged: (String? newValue){
                  setState(() {

                    secilenKategori = newValue!;
                  });
                },
                hint: Text("Kategori Seçin"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _urunAdiController,
                decoration: InputDecoration(hintText:"İçecek Adını girin",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange.shade100,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  DropdownButton(
                    //isExpanded: true,
                    value: secilenTL,
                    icon:const  Icon(Icons.keyboard_arrow_down),
                    items:fiyatTL.map((String items) {
                      return DropdownMenuItem(
                          value: items,
                          child: Text(items)
                      );
                    }
                    ).toList(),
                    onChanged: (String? newValue){
                      setState(() {

                        secilenTL = newValue!;
                      });
                    },
                    hint: Text("TL Seçin"),
                  ),
                  Text("₺",style: TextStyle(fontSize: 20),),
                  SizedBox(width: 15,),
                  DropdownButton(
                    //isExpanded: true,
                    value: secilenKrs,
                    icon:const  Icon(Icons.keyboard_arrow_down),
                    items:fiyatTL.map((String items) {
                      return DropdownMenuItem(
                          value: items,
                          child: Text(items)
                      );
                    }
                    ).toList(),
                    onChanged: (String? newValue){
                      setState(() {

                        secilenKrs = newValue!;
                      });
                    },
                    hint: Text("Kuruş Seçin"),
                  ),Text("Kuruş"),
                ],
              ),
              Row(
                children: [
                  Text("Stok durumu : ",style: TextStyle(fontSize: 16),),
                  Switch(
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red.shade300,
                    inactiveThumbColor: Colors.red,
                    value: durumStok,
                    onChanged: (value) {
                      print("Stok Durumu : $value");
                      setState(() {
                        durumStok = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Alkol durumu : ",style: TextStyle(fontSize: 16),),
                  Switch(
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red.shade300,
                    inactiveThumbColor: Colors.red,
                    value: durumAlkol,
                    onChanged: (value) {
                      print("Alkol Durumu : $value");
                      setState(() {
                        durumAlkol = value;
                      });
                    },
                  ),
                ],
              ),Center(
                child: Container(
                  width: 100,
                  child: ElevatedButton(onPressed: (){
                    double para=double.parse("$secilenTL.$secilenKrs");
                    _icecekEkleService.icecekEkle(_urunAdiController.text,secilenKategori!, durumStok, durumAlkol, para, urunImage);
                     Fluttertoast.showToast(msg: "Ürün Başarıyla Eklendi");
                  }, child: Text("EKLE",style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),

            ],
          ),
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
