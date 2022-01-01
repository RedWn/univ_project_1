import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditProduct extends StatefulWidget {
  final String token;
  final String id;
  const EditProduct({Key? key, required this.token, required this.id})
      : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  Color nameShadowColor = Assets.shadowColor;
  Color priceShadowColor = Assets.shadowColor;
  Color numShadowColor = Assets.shadowColor;
  Color quantityShadowColor = Assets.shadowColor;
  ImagePicker picker = ImagePicker();
  XFile? image;
  String name = "";
  String price = "";
  String quantity = "";
  String num = "";
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
                    'Edit a product',
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 5,
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
                                return Colors.deepPurple.withOpacity(0.04);
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
                          'Upload new Image',
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
                            name = x;
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
                    ), //name
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
                                price = x;
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
                        ), //price
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
                                quantity = x;
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
                        ), //quantity
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
                            num = x;
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
                    ), //num
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Assets.errorShadowColor),
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
                                    return Colors.deepPurple.withOpacity(0.04);
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
                              delete(context);
                            },
                            child: Text(
                              'DELETE',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: SizedBox(
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
                                    return Colors.deepPurple.withOpacity(0.04);
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
                              add(context);
                            },
                            child: Text(
                              'Edit',
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

  Future<void> delete(context) async {
    var tok = widget.token;
    final response =
        await http.delete(Uri.parse(Assets.link + "delete" + "/" + widget.id),
            headers: {
              "Accept": "application/json",
              'Authorization': 'Bearer $tok',
            },
            encoding: Encoding.getByName('utf-8'));
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      //TODO: add something
    }
  }

  Future<void> add(context) async {
    var map = <String, dynamic>{};
    if (name.isNotEmpty) {
      map['name'] = name;
    }
    if (price.isNotEmpty) {
      map['price'] = price;
    }
    if (quantity.isNotEmpty) {
      map['quantity'] = quantity;
    }
    if (num.isNotEmpty) {
      map['contact_info'] = num;
    }
    map["image"] = "image"; //TODO
    String tok = widget.token;
    final response =
        await http.post(Uri.parse(Assets.link + "update" + "/" + widget.id),
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Accept": "application/json",
              'Authorization': 'Bearer $tok',
            },
            encoding: Encoding.getByName('utf-8'),
            body: map);
    Map<String, dynamic> resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else if (response.statusCode == 401) {
      //TODO: add something
    }
  }

  void auto() {
    Navigator.pop(context);
  }
}
