import 'package:flutter/material.dart';
class BizKimiz extends StatefulWidget {
  const BizKimiz({Key? key}) : super(key: key);

  @override
  State<BizKimiz> createState() => _BizKimizState();
}

class _BizKimizState extends State<BizKimiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biz Kimiz?"),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("""
          Bu uygulama Bilişim Teknolojileri Dersi içeriğine
          Konya Teknik Üniversitesi bünyesinde kodlanmıştır.
          Bu programı yazan Yunus TURHAN'dır.
          1996 Nisan doğumlu Yunus lisede başlayan yazılım 
          serüvenine mobil programlama ile devam etmektedir.
          iletişim : yns.trhn253@gmail.com
          """)
        ],
      ),
    );
  }
}
