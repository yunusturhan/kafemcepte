import 'package:flutter/material.dart';
import 'package:kafemcepte/drawer.dart';
import 'package:kafemcepte/main.dart';
import 'package:kafemcepte/service/auth_service.dart';
import 'package:kafemcepte/yonetim/resim_ekle.dart';
import 'package:kafemcepte/yonetim/urun_ekle_icecek.dart';
import 'package:kafemcepte/yonetim/urun_ekle_yiyecek.dart';
import 'package:kafemcepte/yonetim/yonetim_giris.dart';
import 'package:provider/provider.dart';
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
          ElevatedButton.icon(onPressed: () async {
    await context.read<AuthService>().signOut();
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => ChangeNotifierProvider(
    create: (_) => AuthService(),
    child: YonetimGiris()),
    ));
    }, icon:const Icon(Icons.exit_to_app_outlined), label: const Text("Çıkş"))
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const  <Widget>[
                    Icon(
                      Icons.local_cafe,
                      color: Colors.white,
                      size: 100.0,
                    ),
                    Text(
                      "KafemCepte",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.brown,
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title:const  Text('Anasayfa'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Anasayfa()));
              },
            ),

            ExpansionTile(
              leading: const Icon(Icons.perm_device_information),
              title: const Text('Kurumsal'),
              trailing: const Icon(Icons.arrow_drop_down),
              children: <Widget>[
                ListTile(
                  title:const  Text('Biz Kimiz'),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, "/bizkimiz");
                  },
                ),
                ListTile(
                  title: const Text('Tarihçemiz'),
                  trailing:const  Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, "/tarihcemiz");
                  },
                ),
                ListTile(
                  title: const Text('Kurumsal'),
                  trailing:const  Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, "/kurumsal");
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title:const  Text('Galeri'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/galeri");
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('İletişim'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/iletisim");
              },
            ),
            ListTile(
              leading:const  Icon(Icons.admin_panel_settings_outlined),
              title:const  Text('Yönetim'),
              trailing:const  Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                  create: (_)=>AuthService(),
                  child: const YonetimGiris(),
                )));
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text("Hoşgeldin ${context.watch<AuthService>().user!.email}"),
            const Icon(Icons.manage_accounts_outlined,size:128,color: Colors.blue,),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UrunEkleYiyecekSayfasi()));
            }, icon:const Icon(Icons.room_service_outlined,color: Colors.white,size: 32,), label:const Text("YİYECEK EKLE",style: TextStyle(color: Colors.white),),),),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UrunEkleIcecekSayfasi()));
            }, icon:Icon(Icons.local_cafe_outlined,color: Colors.white,size: 32,), label:const Text("İÇECEK EKLE",style: TextStyle(color: Colors.white),),),),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){}, icon:const Icon(Icons.edit_rounded,color: Colors.white), label:const Text("ÜRÜNLERİ DÜZENLE",style: TextStyle(color: Colors.white),),),),
            SizedBox(width: 300,child: ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GaleriResimYonetim()));
            }, icon:const Icon(Icons.add_a_photo_outlined ,color: Colors.white), label:const Text("GALERİYE FOTOĞRAF EKLE",style: TextStyle(color: Colors.white),),),),

          ],
        ),
      ),
    );
  }
}
