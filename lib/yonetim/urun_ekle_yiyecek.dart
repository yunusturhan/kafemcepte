import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafemcepte/service/yiyecek_service.dart';

class UrunEkleYiyecekSayfasi extends StatefulWidget {
  const UrunEkleYiyecekSayfasi({Key? key}) : super(key: key);

  @override
  State<UrunEkleYiyecekSayfasi> createState() => _UrunEkleYiyecekSayfasiState();
}

class _UrunEkleYiyecekSayfasiState extends State<UrunEkleYiyecekSayfasi> {
  final kategoriList=['Çorba','Salata','Makarna','Pizza','Hamburger','Tatlı'];
  final fiyatTL=[
    for(int i=0;i<100;i++) "$i"
  ];
  String? secilenKategori,secilenTL,secilenKrs;
  bool durumStok=false,durumGluten=false;
  final YiyecekEkleService _yiyecekEkleService =YiyecekEkleService();




  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var urunImage;
  final TextEditingController _urunAdiController= TextEditingController();
  final TextEditingController _urunAciklamaController=TextEditingController();


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
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() => print("complete"));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("YİYECEK EKLE",style: TextStyle(color: Colors.white),),),
        actions: [Container()],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Center(child: imagePlace(),),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,children: [
                  InkWell(
                    child:const Icon(Icons.camera_alt,size: 48,),onTap: ()=>_onImageButtonPressed(ImageSource.camera,context: context),
                  ),
                  InkWell(
                    child: const Icon(Icons.image,size: 48,),onTap: ()=>_onImageButtonPressed(ImageSource.gallery,context: context),
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
                hint: const Text("Kategori Seçin"),
              ),
              TextField(
                controller: _urunAdiController,
                decoration: InputDecoration(hintText:"Ürün Adını girin",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange.shade100,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextField(
                controller: _urunAciklamaController,
                decoration: InputDecoration(hintText:"Ürün Açıklaması girin",
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
                    hint: const Text("TL Seçin"),
                  ),
                  const Text("₺",style: TextStyle(fontSize: 20),),
                  const SizedBox(width: 15,),
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
                    hint: const Text("Kuruş Seçin"),
                  ),const Text("Kuruş"),
                ],
              ),
              Row(
                children: [
                  const Text("Stok durumu : ",style: TextStyle(fontSize: 16),),
                  Switch(
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red.shade300,
                    inactiveThumbColor: Colors.red,
                    value: durumStok,
                    onChanged: (value) {
                      if (kDebugMode) {
                        print("Stok Durumu : $value");
                      }
                      setState(() {
                        durumStok = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Gluten durumu : ",style: TextStyle(fontSize: 16),),
                  Switch(
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red.shade300,
                    inactiveThumbColor: Colors.red,
                    value: durumGluten,
                    onChanged: (value) {
                      //print("Gluten Durumu : $value");
                      setState(() {
                        durumGluten = value;
                      });
                    },
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(onPressed: (){
                    double para=double.parse("$secilenTL.$secilenKrs");
                    _yiyecekEkleService.yiyecekEkle(_urunAdiController.text, secilenKategori!, durumStok, durumGluten,_urunAciklamaController.text, para, urunImage).then((value) => print("kayit tamam"));
                    Fluttertoast.showToast(msg: "Ürün Başarıyla Eklendi");
                  }, child: const Text("EKLE",style:  TextStyle(color: Colors.white,fontSize: 20),)),
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
        if (kDebugMode) {
          print("dosyaya geldim: $urunImage");
        }
        if (urunImage != null) {}
      });
    } catch (e) {
      setState(() {
        _pickImage = e;
        if (kDebugMode) {
          print("Image Error: " + _pickImage);
        }
      });
    }
  }
}
