import 'package:test4/main.dart';
import 'package:flutter/material.dart';

class Product {
  static Widget get (BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Assets.backgroundColor.withOpacity(0.9),
          borderRadius: BorderRadius.all(
              Radius.circular(Assets.roundCorners)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 6,
              spreadRadius: 1,
              color: Assets.shadowColor,
            )
          ]),
      child: Column(
        children: [
          Image.asset('Assets/test1.png'),
          Text('Product Name', style: TextStyle(fontSize: 20, fontFamily: Assets.mainFont, color: Assets.textColor, height: 2),),
            ]
          )
      );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Assets.backgroundColor,
        drawer: Drawer(

        ),
        body: ListView(
          children: [
            Product.get(context),
            Product.get(context),
            Product.get(context),
          ],
        ),
      ),
    );
  }
}
