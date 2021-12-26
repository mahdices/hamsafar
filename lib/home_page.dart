import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hamsafar/appconfig.dart';
import 'package:latlong2/latlong.dart';
import 'package:location';

class HomePage extends StatelessWidget {
  var location = Location
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                    margin: const EdgeInsets.only(right: 16),
                    alignment: Alignment.centerRight,
                    width: 100,
                    child: Icon(Icons.menu)),
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
          )
        ],
      ),
    );
  }
}
