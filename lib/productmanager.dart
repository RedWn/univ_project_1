import 'package:test4/main.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color nameShadowColor = Assets.shadowColor;
  Color priceShadowColor = Assets.shadowColor;
  Color numShadowColor = Assets.shadowColor;
  Color quantityShadowColor = Assets.shadowColor;
  Color dateShadowColor = Assets.shadowColor;
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
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 25),
                  child: Text(
                    'Add a product',
                    style: TextStyle(
                      fontFamily: Assets.mainFont,
                      fontSize: 50,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                ),
                Column(
                  children: [
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
                        onTap: () {
                          setState(() {
                            nameShadowColor = Assets.tappedShadowColor;
                            priceShadowColor = Assets.shadowColor;
                            numShadowColor = Assets.shadowColor;
                            quantityShadowColor = Assets.shadowColor;
                            dateShadowColor = Assets.shadowColor;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Assets.textColor,
                          fontSize: 25,
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
                              color: priceShadowColor,
                            )
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          setState(() {
                            nameShadowColor = Assets.shadowColor;
                            priceShadowColor = Assets.tappedShadowColor;
                            numShadowColor = Assets.shadowColor;
                            quantityShadowColor = Assets.shadowColor;
                            dateShadowColor = Assets.shadowColor;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Assets.textColor,
                          fontSize: 25,
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
                            'Price',
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
                        onTap: () {
                          setState(() {
                            nameShadowColor = Assets.shadowColor;
                            priceShadowColor = Assets.shadowColor;
                            numShadowColor = Assets.tappedShadowColor;
                            quantityShadowColor = Assets.shadowColor;
                            dateShadowColor = Assets.shadowColor;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Assets.textColor,
                          fontSize: 25,
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
                              color: quantityShadowColor,
                            )
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          setState(() {
                            nameShadowColor = Assets.shadowColor;
                            priceShadowColor = Assets.shadowColor;
                            numShadowColor = Assets.shadowColor;
                            quantityShadowColor = Assets.tappedShadowColor;
                            dateShadowColor = Assets.shadowColor;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Assets.textColor,
                          fontSize: 25,
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
                            'Quantity',
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
                          onTap: () {
                            setState(() {
                              nameShadowColor = Assets.shadowColor;
                              priceShadowColor = Assets.shadowColor;
                              numShadowColor = Assets.shadowColor;
                              quantityShadowColor = Assets.shadowColor;
                              dateShadowColor = Assets.tappedShadowColor;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Assets.primaryColor),
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
                          onPressed: () {},
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: Assets.mainFont,
                            ),
                          )),
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
}
