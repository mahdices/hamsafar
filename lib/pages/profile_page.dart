import 'package:flutter/material.dart';
import 'package:hamsafar/components/avatar_rate_widget.dart';
import 'package:hamsafar/components/custom_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("پروفایل"),
      body: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              AvatarRateWidget(),
              SizedBox(
                height: 16,
              ),
              Text(
                "مهدی میرزاده",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اطلاعات فردی",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "کد شناسایی",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  )),
                  Expanded(
                      child: Text(
                    "شماره موبایل",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "2896742",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    "091200202002",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "نام وسیله",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  )),
                  Expanded(
                      child: Text(
                    "پلاک",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "پیکان ۵۸",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Stack(
                    children: [
                      Image.asset("assets/png/car_plate.png"),
                      Positioned(
                        top: 4,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "20",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Text(
                                "34ب453",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("/edit-financial");
                },
                child: Row(
                  children: [
                    Text(
                      "اطلاعات مالی",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 12,),
                    Text("ویرایش",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "شماره شبا",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "IR-2349830947839847373",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "شماره کارت",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "3847 8374 9384 3847",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: 36,
                      height: 36,
                      child: Image.asset("assets/temp/bank.png"))
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
