import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafemcepte/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    CollectionReference yiyeceklerlerRef=_firestore.collection("Yiyecekler");
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("KafemCepte Menü",style: TextStyle(color: Colors.white),),),
      actions: [
        Container()
      ]),

      body:Center(
        child: Column(children: [
          Container(padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Yiyeceklerimiz",style: TextStyle(fontFamily: "Lobster",fontSize: 32),)),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() => print("Çorbalar"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Çorbalar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18),),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Salatalar"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Salatalar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Makarnalar"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Makarnalar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
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
                      onTap:() => print("Pizzalar"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Pizzalar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Hamburgerler"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Hamburgerler",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Tatlılar"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Tatlılar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        ),),
                      ),
                    ),
                  ],
                ),//yiyecek 2.satır

                Center(child: Text("İçeceklerimiz",style: TextStyle(fontFamily: "Lobster",fontSize: 32),)),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() => print("Çaylar"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Çaylar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18),),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Meyve suyu"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Meyve Suyu",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Gazlı içecek"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Gazlı içecek",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
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
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Limonatalar",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Kahveler"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Kahveler",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap:() => print("Alkoll Kahveler"),
                      child: Container(margin: EdgeInsets.all(10),
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
                            Text("Alkollü İçecek",style:TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 18)),
                          ],
                        ),),
                      ),
                    ),
                  ],
                ),//içecek 2.satır


              ],
            ),
          )






         /* StreamBuilder(
              stream: yiyeceklerlerRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
                try{
                  List<DocumentSnapshot> okunanSnapshot=asyncSnapshot.data.docs!;
                  return !asyncSnapshot.hasData ? Center(child: CircularProgressIndicator()):
                      Flexible(child: ListView.builder(itemCount: okunanSnapshot.length,
                          itemBuilder:(context,index){
                        return Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(185, 195, 146, 100)),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                "${okunanSnapshot[index].get('isim')}",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  //Image.network(src).,
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white),
                                    margin: EdgeInsets.all(5),
                                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(8),),
                                      child: Image.network('${okunanSnapshot[index].get("resim")}',fit: BoxFit.cover),
                                    ),
                                  ),
                                  for(int i=0;i<10;i++)
                                    Container(),

                                  if(okunanSnapshot[index].get("stok_durumu")==false)
                                  Row(
                                    children: [
                                      Icon(Icons.cancel_rounded,color: Colors.red,size: 48,),
                                      Text("Bu ürün tükendi.",style: TextStyle(fontSize: 18),),
                                    ],
                                  )
                                  else Text("${okunanSnapshot[index].get("fiyat").toString()} ₺",style: TextStyle(fontSize: 24),)

                                ],
                              ),
                            ],
                          ),
                        );
                          }



                      ));

                }catch(e){
                  print(e);
                  return Center(child: LinearProgressIndicator(),);
                }
              }   ),

*/

        ],)
      ),

      endDrawer: MyDrawer(),
    );
  }
}

