
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafemcepte/diger_sayfalar/biz_kimiz.dart';
import 'package:kafemcepte/diger_sayfalar/galeri.dart';
import 'package:kafemcepte/diger_sayfalar/iletisim.dart';
import 'package:kafemcepte/service/auth_service.dart';
import 'package:kafemcepte/urun_gosterim/icecek_gosterim_sayfasi.dart';
import 'package:kafemcepte/urun_gosterim/yiyecek_gosterim_sayfasi.dart';
import 'package:kafemcepte/yonetim/yonetim_giris.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KafemCepte',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const Anasayfa(),
    );
  }
}
class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var konum;
    konumGuncelleme()async{
      print("güncelleme başladı");
      konum= await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.best);
      var basKonum=LatLng(konum.latitude, konum.longitude);
      //konumu={"x_konumu":konum.latitude,"y_konumu":konum.longitude};
      print("${konum.latitude} ${konum.longitude}   konumlar");
          }
    konumGuncelleme();







    return Scaffold(
      appBar: AppBar(title:const Center(child: Text("KafemCepte Menü",style: TextStyle(color: Colors.white),),),
      actions: [
        Container()
      ]),

      body:Center(
        child: Column(children: [
          Container(padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: Text("Yiyeceklerimiz",style: TextStyle(fontFamily: "Lobster",fontSize: 32),)),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() {
                            print("Çorbalar");
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const YiyecekGosterimSayfasi(yiyecek_kategorisi: "Çorba",baslik: "Çorbalarımız",)));
                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/yiyecek_icon/corba.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Çorba",style: TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18),),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() {
                        print("Salatalar");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const YiyecekGosterimSayfasi(baslik: "Salatalarımız",yiyecek_kategorisi: "Salata",)));
                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/yiyecek_icon/salata.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Salata",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() {
                        print("Makarnalar");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const YiyecekGosterimSayfasi(baslik: "Makarnalarımız",yiyecek_kategorisi: "Makarna",)));

                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/yiyecek_icon/makarna.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Makarna",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        ),),
                      ),
                    ),
                  ],
                ),//yiyecek 1.satir
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() {
                        print("Pizzalar");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const YiyecekGosterimSayfasi(baslik: "Pizzalarımız",yiyecek_kategorisi: "Pizza",)));

                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/yiyecek_icon/pizza.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Pizza",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() {
                        print("Hamburgerler");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const YiyecekGosterimSayfasi(baslik: "Hamburgerlerimiz",yiyecek_kategorisi: "Hamburger",)));

                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/yiyecek_icon/hamburger.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Hamburger",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() {
                        print("Tatlılar");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const YiyecekGosterimSayfasi(baslik: "Tatlılarımız",yiyecek_kategorisi: "Tatlı",)));

                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/yiyecek_icon/tatli.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const  Text("Tatlı",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        ),),
                      ),
                    ),
                  ],
                ),//yiyecek 2.satır

                const Center(child: Text("İçeceklerimiz",style: TextStyle(fontFamily: "Lobster",fontSize: 32),)),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() => print("Çaylar"),
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icecek_icon/cay.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const  Text("Çay",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18),),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Meyve suyu"),
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icecek_icon/meyvesuyu.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const  Text("Meyve Suyu",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Gazlı içecek"),
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icecek_icon/gazli_icecek.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const  Text("Gazlı içecek",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        ),),
                      ),
                    ),
                  ],
                ),// içecek 1.satir
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() => print("Limonatalar"),
                      child: Container(margin:const  EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icecek_icon/limonata.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Limonata",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Kahveler"),
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icecek_icon/kahve.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const Text("Kahve",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() {
                            print("Alkollü içecek");
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IcecekGosterimSayfasi(icecek_kategorisi: "Alkollü İçecek", baslik:"Alkollü İçeceklerimiz")));
                      },
                      child: Container(margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
                        width: 100,
                        height: 100,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icecek_icon/alkol.png",width: MediaQuery.of(context).size.height*0.08,height:MediaQuery.of(context).size.height*0.08,),
                            const  Text("Alkollü İçecek",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        ),),
                      ),
                    ),
                  ],
                ),//içecek 2.satır


              ],
            ),
          )






        ],)
      ),

      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
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
              title: const Text('Anasayfa'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Anasayfa()));
              },
            ),

            ExpansionTile(
              leading:const  Icon(Icons.perm_device_information),
              title: const Text('Kurumsal'),
              trailing:const  Icon(Icons.arrow_drop_down),
              children: <Widget>[
                ListTile(
                  title: const Text('Biz Kimiz'),
                  trailing:const  Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BizKimiz()));
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
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IletisimSayfasi(x_konumu:38.0172112,y_konumu:32.5170063,)));
                  },
                ),
              ],
            ),
            ListTile(
              leading:const  Icon(Icons.image),
              title: const Text('Galeri'),
              trailing:const  Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Galeri()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('İletişim'),
              trailing:const  Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IletisimSayfasi(x_konumu:38.0172112,y_konumu:32.5170063,)));
              },
            ),





            ListTile(
              leading: const Icon(Icons.admin_panel_settings_outlined),
              title: const Text('Yönetim'),
              trailing: const Icon(Icons.arrow_right),
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
    );
  }
}

