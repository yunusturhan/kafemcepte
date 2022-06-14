import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Galeri extends StatefulWidget {
  const Galeri({Key? key}) : super(key: key);

  @override
  State<Galeri> createState() => _GaleriState();
}

class _GaleriState extends State<Galeri> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference galeriRef=_firestore.collection("Galeri");
    return Scaffold(
      appBar: AppBar(
        title: Text("Kafemizden Kareler"),

      ),
      body: Center(
        child: StreamBuilder(
            stream: galeriRef.where("kategori").snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
              try{
                List<DocumentSnapshot> okunanSnapshot=asyncSnapshot.data.docs!;
                return !asyncSnapshot.hasData ? Center(child: CircularProgressIndicator()):
                ListView.builder(itemCount: okunanSnapshot.length,
                    itemBuilder:(context,index){
                      return Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                            color: Colors.white),
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(8),),
                          child: Image.network('${okunanSnapshot[index].get("resim")}',fit: BoxFit.cover),
                        ),
                      );
                    }



                );

              }catch(e){
                print(e);
                return Center(child: LinearProgressIndicator(),);
              }
            }   ),
      ),
    );
  }
}
