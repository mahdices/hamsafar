import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamsafar/appconfig.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24),
                height: MediaQuery.of(context).size.height / 3,
                child: SvgPicture.asset("assets/svg/login_car.svg")),
            Text(
              "ورود به همسفر",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text("نام کاربری"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text("کلمه عبور"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(AppConfig.primaryColor)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))))),
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                child: Text("ورود"),
              ),
            ),
            Container(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "ثبت نام",
                      style: TextStyle(color: Color(AppConfig.primaryColor)),
                    ))),
          ],
        ),
      ),
    );
  }
}
