import 'package:flutter/material.dart';
import 'package:kafemcepte/diger_sayfalar/galeri.dart';
import 'package:kafemcepte/diger_sayfalar/iletisim.dart';
import 'package:kafemcepte/main.dart';
import 'package:kafemcepte/service/auth_service.dart';
import 'package:kafemcepte/yonetim/yonetim_giris.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Anasayfa()));
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
                title: Text('Tarih??emiz'),
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Galeri()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('??leti??im'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
           //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IletisimSayfasi()));
            },
          ),

          ListTile(
            leading: Icon(Icons.admin_panel_settings_outlined),
            title: Text('Y??netim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                create: (_)=>AuthService(),
                child: YonetimGiris(),
              )));
            },
          ),

        ],
      ),
    );
  }
}