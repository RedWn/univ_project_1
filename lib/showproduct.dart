import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:univ_project_1/productspage.dart';

class ShowProduct extends StatelessWidget {
  final String index;
  const ShowProduct({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final response = await http.post(Uri.parse(Assets.link + "showDetails"),
    //     headers: {
    //       "Content-Type": "application/x-www-form-urlencoded",
    //       "Accept": "application/json",
    //     },
    //     encoding: Encoding.getByName('utf-8'));
    // List<dynamic> resp =
    //     jsonDecode(response.body);
    return Scaffold(
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            width: 200,
            height: 200,
            image: AssetImage('images/scopinal.jpg'), //TODO: fix this
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            color: Assets.primaryColor,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "test",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Assets.lightTextColor,
                      fontFamily: 'BalooBhaijaan2-VariableFont_wght',
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
            color: Assets.primaryColor,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Assets.lightTextColor,
                      fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            color: Assets.primaryColor,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '11/12/2022',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Assets.lightTextColor,
                      fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            color: Assets.primaryColor,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ahmad',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Assets.lightTextColor,
                      fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            color: Assets.primaryColor,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '09548755',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Assets.lightTextColor,
                      fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
