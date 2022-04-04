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
          StreamBuilder(
              stream: yiyeceklerlerRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
                try{
                  List<DocumentSnapshot> okunanSnapshot=asyncSnapshot.data.docs!;
                  return !asyncSnapshot.hasData ? Center(child: CircularProgressIndicator()):
                      Flexible(child: ListView.builder(itemCount: okunanSnapshot.length,
                          itemBuilder:(context,index){
                        return Container(
                          height: 250,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(205, 195, 146, 100)),
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
                                    height: 150,
                                    width: 150,
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
                                  if(okunanSnapshot[index].get("stok_durumu")==false)
                                  Icon(Icons.cancel_rounded,color: Colors.red,size: 48,)
                                  else Text(okunanSnapshot[index].get("fiyat").toString())

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
              }   )
        ],)
      ),
      endDrawer: MyDrawer(),
    );
  }
}

