import 'package:flutter/material.dart';

import '../appconfig.dart';

class AvatarRateWidget extends StatelessWidget {
  const AvatarRateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 110,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/temp/avatar.jpeg"),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(40)),
                      color: Color(AppConfig.primaryColor)),
                  child: Text(
                    "4.5",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
