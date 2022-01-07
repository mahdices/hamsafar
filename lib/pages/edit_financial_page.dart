import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamsafar/appconfig.dart';
import 'package:hamsafar/components/custom_appbar.dart';
import 'package:hamsafar/data/model/bank.dart';
import 'package:hamsafar/utils/card_number_formatter.dart';

class EditFinancialPage extends StatefulWidget {
  EditFinancialPage({Key? key}) : super(key: key);

  @override
  State<EditFinancialPage> createState() => _EditFinancialPageState();
}

class _EditFinancialPageState extends State<EditFinancialPage> {
  Bank _currentSelectedValue = AppConfig.banks[0];
  var cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar("اطلاعات مالی"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            suffix: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    color: Colors.black,
                                    width: 1,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "IR",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                                right: 24, left: 12, top: 16, bottom: 16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                borderSide:
                                    BorderSide(color: Color(0xff04145C))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            labelStyle:
                                TextStyle(color: Color(AppConfig.primaryColor)),
                            label: Text("شماره شبا")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                right: 24, left: 12, top: 16, bottom: 16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                borderSide:
                                    BorderSide(color: Color(0xff04145C))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            labelStyle:
                                TextStyle(color: Color(AppConfig.primaryColor)),
                            label: Text("نام صاحب حساب")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<Bank>(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,fontFamily: 'Dana'),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                right: 24, left: 12, top: 16, bottom: 16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                borderSide:
                                    BorderSide(color: Color(0xff04145C))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            labelStyle: TextStyle(
                                color: Color(AppConfig.primaryColor),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            label: Text("بانک")),
                        onChanged: (bank) {
                          _currentSelectedValue = bank!;
                        },
                        value: _currentSelectedValue,
                        items: AppConfig.banks.map((Bank value) {
                          return DropdownMenuItem<Bank>(
                            value: value,
                            child: Row(
                              children: [
                                Image.asset(
                                  value.fileName,
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(value.name)
                              ],
                            ),
                          );
                        }).toList(),
                        // child: DropdownButton<Bank>(
                        //   value: _currentSelectedValue,
                        //   isDense: true,
                        //   onChanged: (Bank? newValue) {
                        //     setState(() {
                        //       _currentSelectedValue = newValue!;
                        //     });
                        //   },
                        //   items: AppConfig.banks.map((Bank value) {
                        //     return DropdownMenuItem<Bank>(
                        //       value: value,
                        //       child: Row(children: [
                        //         Image.asset(value.fileName,width: 30,),
                        //         SizedBox(width: 12,),
                        //         Text(value.name)
                        //       ],),
                        //     );
                        //   }).toList(),
                        // ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        controller: cardController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardInputFormatter()
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                right: 24, left: 12, top: 16, bottom: 16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                borderSide:
                                    BorderSide(color: Color(0xff04145C))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            labelStyle:
                                TextStyle(color: Color(AppConfig.primaryColor)),
                            label: Text("شماره کارت")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
