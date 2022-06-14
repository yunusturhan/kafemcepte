import 'package:flutter/material.dart';
import 'package:kafemcepte/drawer.dart';
import 'package:kafemcepte/main.dart';
import 'package:kafemcepte/service/auth_service.dart';
import 'package:kafemcepte/yonetim/yonetim_anasayfa.dart';
import 'package:provider/provider.dart';


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
    final myAuth = Provider.of<AuthService>(context, listen: true);
    switch (myAuth.durum) {
      case KullaniciDurumu.OturumAciliyor:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case KullaniciDurumu.OturumAcilmamis:
        return girisYapSayfasi(context);

      case KullaniciDurumu.OturumAcilmis:
        return YonetimAnasayfa();
    }
  }

    Scaffold girisYapSayfasi(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text(
          "Yönetim Giriş", style: TextStyle(color: Colors.white),),),
            actions: [Container()]),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text('Anasayfa'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                },
              ),

              ExpansionTile(
                leading: Icon(Icons.perm_device_information),
                title: Text('Kurumsal'),
                trailing: Icon(Icons.arrow_drop_down),
                children: <Widget>[
                  ListTile(
                    title: Text('Biz Kimiz'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/bizkimiz");
                    },
                  ),
                  ListTile(
                    title: Text('Tarihçemiz'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/tarihcemiz");
                    },
                  ),
                  ListTile(
                    title: Text('Kurumsal'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/kurumsal");
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Galeri'),
                trailing: Icon(Icons.arrow_right),
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
                leading: Icon(Icons.admin_panel_settings_outlined),
                title: Text('Yönetim'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          ChangeNotifierProvider(
                            create: (_) => AuthService(),
                            child: YonetimGiris(),
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
              Text("YÖNETİM GİRİŞ BİLGİLERİ", style: TextStyle(fontSize: 24),),
              TextFormField(
                controller: epostaController,

                decoration: InputDecoration(
                  hintText: "Yönetici E-postanızı girin",
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
                decoration: InputDecoration(
                  hintText: "Yönetici şifrenizi girin",
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
                      color: Theme
                          .of(context)
                          .primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),

                ),
              ),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () async {
                    await context.read<AuthService>()
                        .signInUserWithEmailandPassword(
                        epostaController.text, sifreController.text);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>
                            ChangeNotifierProvider(
                              create: (_) => AuthService(),
                              child: YonetimAnasayfa(),
                            )));
                    Navigator.of(context).push(MaterialPageRoute(builder: (
                        context) => YonetimAnasayfa()));
                  },
                    child: Text("GİRİŞ YAP",
                      style: TextStyle(color: Colors.white, fontSize: 20),),),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  }
}
