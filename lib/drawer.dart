import 'package:flutter/material.dart';
import 'package:kafemcepte/main.dart';
import 'package:kafemcepte/yonetim/yonetim_giris.dart';

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>YonetimGiris()));

            },
          ),

        ],
      ),
    );
  }
}