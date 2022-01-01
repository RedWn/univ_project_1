import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  final String token;
  const AddProduct({Key? key, required this.token}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color nameShadowColor = Assets.shadowColor;
  Color priceShadowColor = Assets.shadowColor;
  Color numShadowColor = Assets.shadowColor;
  Color quantityShadowColor = Assets.shadowColor;
  Color dateShadowColor = Assets.shadowColor;
  ImagePicker picker = ImagePicker();
  XFile? image;
  String name = "";
  String price = "";
  String quantity = "";
  String num = "";
  String category = "";
  List<String> date = ["", "", "", ""];
  List<String> value = ["", "", "", ""];
  String dropdownValue = 'Medicine';
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
                    'Add a product',
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
                      width: MediaQuery.of(context).size.width / 2,
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
                            dateShadowColor = Assets.shadowColor;
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
                                dateShadowColor = Assets.shadowColor;
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
                                dateShadowColor = Assets.shadowColor;
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
                            dateShadowColor = Assets.shadowColor;
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
                              color: dateShadowColor,
                            )
                          ]),
                      child: TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              nameShadowColor = Assets.shadowColor;
                              priceShadowColor = Assets.shadowColor;
                              numShadowColor = Assets.shadowColor;
                              quantityShadowColor = Assets.shadowColor;
                              dateShadowColor = Assets.tappedShadowColor;
                              date[0] = x;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: "YYYY-MM-DD",
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
                              'Expiration Date',
                              style: TextStyle(
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor,
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dateInput(1),
                    const SizedBox(
                      height: 10,
                    ),
                    dateInput(2),
                    const SizedBox(
                      height: 10,
                    ),
                    dateInput(3),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Category: ",
                          style: TextStyle(
                              fontFamily: Assets.mainFont,
                              fontSize: 25,
                              color: Assets.textColor),
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          borderRadius:
                              BorderRadius.circular(Assets.roundCorners),
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: TextStyle(
                              color: Assets.primaryColor,
                              fontFamily: Assets.mainFont,
                              fontSize: 25),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              category = dropdownValue;
                            });
                          },
                          items: <String>[
                            'Medicine',
                            'Creams',
                            'Shampoos',
                            'Others'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
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
                              //auto();
                            },
                            child: Text(
                              'Add',
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

  Future<void> add(context) async {
    String tok = widget.token;
    var request =
        http.MultipartRequest("POST", Uri.parse(Assets.link + "store"));
    request.headers["Content-Type"] = "application/x-www-form-urlencoded";
    request.headers["Accept"] = "application/json";
    request.headers["Authorization"] = "Bearer $tok";
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['quantity'] = quantity;
    request.fields['exp_date'] = date[0];
    request.fields["category"] = category;
    for (int i = 1; i < 4; i++) {
      request.fields["discount_date_$i"] = date[i];
      request.fields["discount_value_$i"] = value[i - 1];
      print(value[i - 1]);
    }
    request.fields['contact_info'] = num;
    request.fields["category"] = category;
    var pic = await http.MultipartFile.fromPath("image", image!.path);
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    // var map = <String, dynamic>{};
    // map['name'] = name;
    // map['price'] = price;
    // map['quantity'] = quantity;
    // map['exp_date'] = date[0];
    // print(value);
    // for (int i = 1; i < 4; i++) {
    //   map["discount_date_$i"] = date[i];
    //   map["discount_value_$i"] = value[i - 1];
    // }
    // map['contact_info'] = num;
    // map['image'] = image; //TODO image
    // map["category"] = category;
    // final response = await http.post(Uri.parse(Assets.link + "store"),
    //     headers: {
    //       "Content-Type": "application/x-www-form-urlencoded",
    //       "Accept": "application/json",
    //       'Authorization': 'Bearer $tok',
    //     },
    //     encoding: Encoding.getByName('utf-8'),
    //     body: map);
    // Map<String, dynamic> resp = jsonDecode(response.body);
    // print(response.body);
    if (response.statusCode == 200) {
      Navigator.pop(this.context);
    } else if (response.statusCode == 401) {
      //TODO: add something
    }
  }

  Widget dateInput(int i) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(50, 0, 5, 0),
          width: MediaQuery.of(this.context).size.width / 2,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(Assets.roundCorners)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: dateShadowColor,
                )
              ]),
          child: TextField(
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
              onChanged: (String x) {
                setState(() {
                  nameShadowColor = Assets.shadowColor;
                  priceShadowColor = Assets.shadowColor;
                  numShadowColor = Assets.shadowColor;
                  quantityShadowColor = Assets.shadowColor;
                  quantityShadowColor = Assets.shadowColor;
                  dateShadowColor = Assets.tappedShadowColor;
                  date[i] = x;
                });
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Assets.textColor,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "YYYY-MM-DD",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  'Discount Date $i',
                  style: TextStyle(
                    fontFamily: Assets.mainFont,
                    color: Assets.textColor,
                  ),
                ),
              )),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          width: MediaQuery.of(this.context).size.width * 1.3 / 6,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(Assets.roundCorners)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: dateShadowColor,
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
                  quantityShadowColor = Assets.shadowColor;
                  dateShadowColor = Assets.tappedShadowColor;
                  value[i - 1] = x;
                });
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Assets.textColor,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  'value',
                  style: TextStyle(
                    fontFamily: Assets.mainFont,
                    color: Assets.textColor,
                  ),
                ),
              )),
        ),
      ],
    );
  }

  void auto() {
    Navigator.pop(this.context);
  }
}
