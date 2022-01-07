import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyText extends StatelessWidget {
  final int price;
  final int size;
  final NumberFormat numberFormat = NumberFormat("#,###");


  CurrencyText({Key? key, required this.price, required this.size})
      : super(key: key){

  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: TextStyle(
              fontFamily: 'Dana',
              color: Colors.black,
              fontWeight: FontWeight.w900),
          children: [
            TextSpan(
                text: numberFormat.format(price),
                style: TextStyle(
                  fontSize: size.toDouble(),
                )),
            WidgetSpan(child: SizedBox(width: 4,)),
            TextSpan(text: "تومان",style: TextStyle(fontSize: size/1.6))
          ]),
    );
  }
}
