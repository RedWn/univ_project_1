import 'package:test4/main.dart';
import 'package:flutter/material.dart';

class Controller {
  static int state = 0;
  static void update(int newState) {
    state = newState;
    if (newState == 1) {
      Product.X = 2;
    }
  }
}

class Product {
  static int X = 1;
  static Widget get(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Assets.backgroundColor.withOpacity(0.9),
            borderRadius:
                BorderRadius.all(Radius.circular(Assets.roundCorners)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 1,
                color: Assets.shadowColor,
              )
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            'Assets/test$X.png',
            fit: BoxFit.fill,
          ),
          Text(
            'Very Cool Red Car',
            style: TextStyle(
                fontSize: 20,
                fontFamily: Assets.mainFont,
                color: Assets.textColor,
                height: 2),
          ),
        ]));
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
    var indexer = 0;
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Assets.primaryColor.withOpacity(0.9),
          foregroundColor: Assets.backgroundColor,
          child: Icon(Icons.add_circle_rounded),
          onPressed: () {},
        ),
        appBar: AppBar(
          foregroundColor: Assets.backgroundColor,
          title: Text('All Products'),
          backgroundColor: Assets.primaryColor.withOpacity(0.9),
        ),
        backgroundColor: Assets.backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Assets.primaryColor,
            currentIndex: indexer,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.featured_play_list), label: "All Products"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.featured_play_list), label: "My Products"),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "favorites",
              )
            ],
            onTap: (index) {
              setState(() {
                indexer = index;
                Product.X = index + 1;
              });
            }),
        body: ListView(
          children: [
            Product.get(context),
            Product.get(context),
            Product.get(context),
            Product.get(context),
          ],
        ),
      ),
    );
  }
}
