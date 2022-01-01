import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowProduct extends StatefulWidget {
  final String id;
  const ShowProduct({Key? key, required this.id})
      : super(
          key: key,
        );

  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  Map<String, dynamic> ans = {};
  Future getpost() async {
    var response = await http.get(
      Uri.parse(Assets.link + "showDetails" + "/" + widget.id),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      },
    );
    var responsebody = jsonDecode(response.body);
    print(response.body);
    ans['name'] = responsebody["name"];
    ans['price'] = responsebody["price"];
    ans['quantity'] = responsebody["quantity"];
    ans['exp_date'] = responsebody["exp_date"];
    for (int i = 1; i < 4; i++) {
      ans["discount_date_$i"] = responsebody["discount_date_$i"];
      ans["discount_value_$i"] = responsebody["discount_value_$i"];
    }
    ans['contact_info'] = responsebody["contact_info"];
    ans["image"] = responsebody["image"];
    ans["category"] = responsebody["category"];
    return responsebody;
  }

  // int ind = geti();
  @override
  Widget build(BuildContext context) {
    Color shadow = Assets.shadowColor;
    return FutureBuilder(
        future: getpost(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Directionality(
              textDirection: Assets.rtlState(),
              child: Scaffold(
                backgroundColor: Assets.backgroundColor,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        width: 200,
                        height: 200,
                        image: AssetImage('li[po].image'), //Todo
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            color: Assets.primaryColor),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Name:  " + ans["name"],
                                style: TextStyle(
                                  color: Assets.lightTextColor,
                                  fontFamily: Assets.mainFont,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            color: Assets.primaryColor),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Price: " + ans["price"],
                                style: TextStyle(
                                  color: Assets.lightTextColor,
                                  fontFamily: Assets.mainFont,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            color: Assets.primaryColor),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Expiry date:\n" + ans["exp_date"],
                                style: TextStyle(
                                  color: Assets.lightTextColor,
                                  fontFamily: Assets.mainFont,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            color: Assets.primaryColor),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /*Icon(
                          Icons.person_add,
                          color:Colors.indigo,
                        ),*/
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Category: " + ans["category"],
                                style: TextStyle(
                                  color: Assets.lightTextColor,
                                  fontFamily: Assets.mainFont,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            color: Assets.primaryColor),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Contact Info:\n" + ans["contact_info"],
                                style: TextStyle(
                                  color: Assets.lightTextColor,
                                  fontFamily: Assets.mainFont,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: shadow,
                              )
                            ]),
                        child: TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              shadow = Assets.tappedShadowColor;
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
                              'Write a comment',
                              style: TextStyle(
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor,
                              ),
                            ),
                          ),
                        ),
                      ), //password
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
