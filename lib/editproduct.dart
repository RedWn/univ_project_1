import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:univ_project_1/productspage.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  Color nameShadowColor = Assets.shadowColor;
  Color priceShadowColor = Assets.shadowColor;
  Color numShadowColor = Assets.shadowColor;
  Color quantityShadowColor = Assets.shadowColor;
  XFile? image;
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Assets.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 25),
                  child: Text(
                    'Edit product',
                    style: TextStyle(
                      fontFamily: Assets.mainFont,
                      fontSize: 50,
                      color: Assets.textColor,
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Assets.primaryColor),
                          foregroundColor:
                              MaterialStateProperty.all(Assets.backgroundColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Assets.roundCorners))),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.red.withOpacity(0.04);
                              }
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed)) {
                                return const Color(0xFFFFDADB).withOpacity(0.3);
                              }
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        child: Text(
                          'Upload Image',
                          style: TextStyle(fontFamily: Assets.mainFont),
                        ),
                        onPressed: () async {
                          image = await picker.pickImage(
                              source: ImageSource.gallery);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 2),
                              blurRadius: 6,
                              spreadRadius: 1,
                              color: nameShadowColor,
                            )
                          ]),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onChanged: (String x) {
                          setState(() {
                            nameShadowColor = Assets.tappedShadowColor;
                            priceShadowColor = Assets.shadowColor;
                            numShadowColor = Assets.shadowColor;
                            quantityShadowColor = Assets.shadowColor;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Assets.textColor,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(Assets.roundCorners),
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners),
                              ),
                              borderSide: BorderSide(
                                color: Assets.primaryColor,
                                width: 0.01,
                              )),
                          filled: true,
                          fillColor: Assets.backgroundColor.withOpacity(0.9),
                          label: Text(
                            'Product Name',
                            style: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(50, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners)),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 2),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  color: priceShadowColor,
                                )
                              ]),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (String x) {
                              setState(() {
                                nameShadowColor = Assets.shadowColor;
                                priceShadowColor = Assets.tappedShadowColor;
                                numShadowColor = Assets.shadowColor;
                                quantityShadowColor = Assets.shadowColor;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Assets.textColor,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners),
                              )),
                              focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Assets.roundCorners),
                                  ),
                                  borderSide: BorderSide(
                                    color: Assets.primaryColor,
                                    width: 0.01,
                                  )),
                              filled: true,
                              fillColor:
                                  Assets.backgroundColor.withOpacity(0.9),
                              label: Text(
                                'Price',
                                style: TextStyle(
                                  fontFamily: Assets.mainFont,
                                  color: Assets.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 50, 0),
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners)),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 2),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  color: quantityShadowColor,
                                )
                              ]),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (String x) {
                              setState(() {
                                nameShadowColor = Assets.shadowColor;
                                priceShadowColor = Assets.shadowColor;
                                numShadowColor = Assets.shadowColor;
                                quantityShadowColor = Assets.tappedShadowColor;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Assets.textColor,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners),
                              )),
                              focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Assets.roundCorners),
                                  ),
                                  borderSide: BorderSide(
                                    color: Assets.primaryColor,
                                    width: 0.01,
                                  )),
                              filled: true,
                              fillColor:
                                  Assets.backgroundColor.withOpacity(0.9),
                              label: Text(
                                'Quantity',
                                style: TextStyle(
                                  fontFamily: Assets.mainFont,
                                  color: Assets.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 2),
                              blurRadius: 6,
                              spreadRadius: 1,
                              color: numShadowColor,
                            )
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        onChanged: (String x) {
                          setState(() {
                            nameShadowColor = Assets.shadowColor;
                            priceShadowColor = Assets.shadowColor;
                            numShadowColor = Assets.tappedShadowColor;
                            quantityShadowColor = Assets.shadowColor;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Assets.textColor,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(Assets.roundCorners),
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners),
                              ),
                              borderSide: BorderSide(
                                color: Assets.primaryColor,
                                width: 0.01,
                              )),
                          filled: true,
                          fillColor: Assets.backgroundColor.withOpacity(0.9),
                          label: Text(
                            'Phone Number',
                            style: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Assets.primaryColor),
                              foregroundColor: MaterialStateProperty.all(
                                  Assets.backgroundColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Assets.roundCorners))),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors.red.withOpacity(0.04);
                                  }
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed)) {
                                    return const Color(0xFFFFDADB)
                                        .withOpacity(0.3);
                                  }
                                  return null; // Defer to the widget's default.
                                },
                              ),
                            ),
                            onPressed: () {
                              //auto();
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              foregroundColor: MaterialStateProperty.all(
                                  Assets.backgroundColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Assets.roundCorners))),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors.red.withOpacity(0.04);
                                  }
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed)) {
                                    return const Color(0xFFFFDADB)
                                        .withOpacity(0.3);
                                  }
                                  return null; // Defer to the widget's default.
                                },
                              ),
                            ),
                            onPressed: () {
                              //auto();
                            },
                            child: Text(
                              'DELETE',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void auto() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MainPage(token: "name")));
  }

  getProductInfo() async {}
}
