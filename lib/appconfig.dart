import 'package:hamsafar/data/model/bank.dart';

class AppConfig{
  static int primaryColor = 0xff04145C;
  static int greenColor = 0xff4BB15E;
  static int redColor = 0xffB14B4B;

  
  static const banks = [
    Bank(name: "ملت", fileName: "assets/png/mellat.png"),
    Bank(name: "ملی", fileName: "assets/png/melli.png"),
    Bank(name: "دی", fileName: "assets/png/dey.png"),
  ];
  
}