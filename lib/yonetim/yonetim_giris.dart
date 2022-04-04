import 'package:flutter/material.dart';
import 'package:kafemcepte/drawer.dart';
import 'package:kafemcepte/yonetim/yonetim_anasayfa.dart';

class YonetimGiris extends StatefulWidget {
  const YonetimGiris({Key? key}) : super(key: key);

  @override
  State<YonetimGiris> createState() => _YonetimGirisState();
}

class _YonetimGirisState extends State<YonetimGiris> {

  TextEditingController epostaController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  TextEditingController _userPasswordController=TextEditingController();
  bool _passwordVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Yönetim Giriş",style: TextStyle(color: Colors.white),),),
      actions: [Container()]),
      endDrawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("YÖNETİM GİRİŞ BİLGİLERİ",style: TextStyle(fontSize: 24),),
            TextFormField(
              controller: epostaController,
              decoration: InputDecoration(hintText:"Yönetici E-postanızı girin",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange.shade100,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: sifreController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(hintText:"Yönetici şifrenizi girin",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange.shade100,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),

              ),
            ),Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>YonetimAnasayfa()));
                }, child:Text("GİRİŞ YAP",style: TextStyle(color: Colors.white,fontSize: 20),))
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
