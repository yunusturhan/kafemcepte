import 'package:flutter/material.dart';
import 'package:kafemcepte/drawer.dart';
import 'package:kafemcepte/yonetim/urun_ekle_icecek.dart';
import 'package:kafemcepte/yonetim/urun_ekle_yiyecek.dart';
class YonetimAnasayfa extends StatefulWidget {
  const YonetimAnasayfa({Key? key}) : super(key: key);

  @override
  State<YonetimAnasayfa> createState() => _YonetimAnasayfaState();
}

class _YonetimAnasayfaState extends State<YonetimAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Yönetim Anasayfa",style: TextStyle(color: Colors.white),)),
        actions: [
          ElevatedButton.icon(onPressed: (){}, icon:const Icon(Icons.exit_to_app_outlined), label: const Text("Çıkş"))
        ],
      ),
      endDrawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.manage_accounts_outlined,size:128,color: Colors.blue,),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UrunEkleYiyecekSayfasi()));
            }, icon:const Icon(Icons.room_service_outlined,color: Colors.white,size: 32,), label:const Text("YİYECEK EKLE",style: TextStyle(color: Colors.white),),),),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UrunEkleIcecekSayfasi()));
            }, icon:Icon(Icons.local_cafe_outlined,color: Colors.white,size: 32,), label:const Text("İÇECEK EKLE",style: TextStyle(color: Colors.white),),),),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){}, icon:const Icon(Icons.edit_rounded,color: Colors.white), label:const Text("ÜRÜNLERİ DÜZENLE",style: TextStyle(color: Colors.white),),),),

          ],
        ),
      ),
    );
  }
}
