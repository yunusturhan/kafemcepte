import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class YiyecekGosterimSayfasi extends StatefulWidget {
  final yiyecek_kategorisi;
  final baslik;
  const YiyecekGosterimSayfasi({Key? key,required this.yiyecek_kategorisi,required this.baslik}) : super(key: key);

  @override
  State<YiyecekGosterimSayfasi> createState() => _YiyecekGosterimSayfasiState();
}

class _YiyecekGosterimSayfasiState extends State<YiyecekGosterimSayfasi> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {

    CollectionReference yiyeceklerlerRef=_firestore.collection("Yiyecekler");
    return Scaffold(
      appBar: AppBar(title: Center(child:Text(super.widget.baslik,style:TextStyle(fontFamily: "Lobster",fontSize: 32),) ,),
      ),
      body: Center(
        child: Column(
          children: [

            StreamBuilder(
              stream: yiyeceklerlerRef.where("kategori",isEqualTo: super.widget.yiyecek_kategorisi).snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
                try{
                  List<DocumentSnapshot> okunanSnapshot=asyncSnapshot.data.docs!;
                  return !asyncSnapshot.hasData ? Center(child: CircularProgressIndicator()):
                      Flexible(child: ListView.builder(itemCount: okunanSnapshot.length,
                          itemBuilder:(context,index){
                        return Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color:Colors.orange),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                "${okunanSnapshot[index].get('isim')}",
                                style: TextStyle(fontFamily: "ShadowsIntoLight",fontSize: 24,),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Image.network(src).,
                                  Container(
                                    height: 120,
                                    width: 120,
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


                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      if(okunanSnapshot[index].get("stok_durumu")==false)
                                        Row(
                                          children: [
                                            Icon(Icons.cancel_rounded,color: Colors.red,size: 48,),
                                            Text("Bu ürün tükendi.",style: TextStyle(fontSize: 18),),
                                          ],
                                        )
                                      else Text("${okunanSnapshot[index].get("fiyat").toString()} ₺",style: TextStyle(fontSize: 24),),


                                      if(okunanSnapshot[index].get("gluten_durumu")==true) Text("Not : Bu ürün gluten içermektedir.") else Container()
                                    ],
                                  ),

                                  Container(),
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
          ],
        ),
      ),
    );
  }
}
