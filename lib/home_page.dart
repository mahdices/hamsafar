import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hamsafar/appconfig.dart';
import 'package:hamsafar/components/avatar_rate_widget.dart';
import 'package:hamsafar/components/item_drawer.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                attributionBuilder: (_) {
                  return Text("© OpenStreetMap contributors");
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(51.5, -0.09),
                    builder: (ctx) => Container(
                      child: FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: Offset(0, 1))
                ]),
            margin: const EdgeInsets.all(24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      alignment: Alignment.centerRight,
                      width: 100,
                      child: Icon(Icons.menu)),
                ),
                Spacer(),
                Text(
                  "در دسترس",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Container(
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    width: 100,
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Color(AppConfig.primaryColor),
                    ))
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 16),
              AvatarRateWidget(),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "مهدی میرزاده",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    height: 30,
                    width: 1,
                    color: Colors.black,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "2201107",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.qr_code_rounded)
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Expanded(
                  child: ListView(
                children: [
                  ItemDrawer(
                    title: "پروفایل",
                    icon: Icons.person_rounded,
                    callback: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/profile");
                    },
                  ),
                  ItemDrawer(
                    title: "کیف پول",
                    icon: Icons.account_balance_wallet_rounded,
                    callback: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/wallet");
                    },
                    widget: Container(
                      padding: const EdgeInsets.only(
                          top: 3, bottom: 3, left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: Color(AppConfig.greenColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Dana",
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            children: [
                              TextSpan(text: "۵۰۰.۰۰۰"),
                              TextSpan(
                                  text: " تومان",
                                  style: TextStyle(fontSize: 12)),
                            ]),
                      ),
                    ),
                  ),
                  ItemDrawer(
                      title: "سابقه سفر ها", icon: Icons.list_alt_rounded),
                  ItemDrawer(
                      title: "پشتیبانی", icon: Icons.support_agent_rounded),
                  ItemDrawer(title: "تنظیمات", icon: Icons.settings_rounded),
                  ItemDrawer(title: "پیام های من", icon: Icons.mail_rounded),
                  ItemDrawer(
                      title: "ویدئو های آموزشی",
                      icon: Icons.smart_display_rounded),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
