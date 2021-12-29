import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:univ_project_1/addproduct.dart';
import 'package:univ_project_1/editproduct.dart';
import 'package:univ_project_1/showproduct.dart';
import 'package:http/http.dart' as http;

class Product extends StatelessWidget {
  Product(
      {required this.img,
      required this.text,
      required this.index,
      required this.state});
  final Image img;
  final String text;
  final String index;
  final String state;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Assets.backgroundColor),
            foregroundColor: MaterialStateProperty.all(Assets.textColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.red.withOpacity(0.04);
                }
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return const Color(0xFFFFDADB);
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            img,
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: Assets.mainFont,
                  color: Assets.textColor,
                  height: 2),
            ),
          ]),
          onPressed: () {
            if (state == "My Products") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProduct()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowProduct(
                            index: index,
                          )));
            }
          },
        ));
  }
}

class MainPage extends StatefulWidget {
  final String token;
  const MainPage({Key? key, required this.token}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> getAll() async {
    print("hi");
    final response = await http.get(
      Uri.parse(Assets.link + "showAllProducts"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      },
    );
    List<dynamic> resp =
        jsonDecode(response.body); //TODO: search single clients
    for (int i = 0; i < resp.length; i++) {
      Product temp = Product(
          img: Image.asset(resp[i]["image"]),
          text: resp[i]["name"],
          index: i.toString(),
          state: title);
      Products.add(temp);
    }
  }

  // Map<String, Image> getMy(){}
  // Map<String, Image> getFav(){}
  Future<List<Product>> getProducts(String mode) async {
    Products = [];
    if (mode == 'All Products') {
      await getAll();
      print(Products);
    } else if (mode == 'My Products') {
      // map = getMy();
    } else if (mode == 'Favorites') {
      // map = getFav();
      for (int i = 0; i < 5; i++) {
        Product temp = Product(
            img: Image.asset('Assets/test$i.png'),
            text: 'Very Cool Car #$i',
            index: "0",
            state: title);
        Products.add(temp);
      }
    }

    return Products;
  }

  int _selectedIndex = 0;
  String title = 'All Products';
  List<Product> Products = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Assets.primaryColor,
            foregroundColor: Assets.lightTextColor,
            child: const Icon(Icons.add_circle_rounded),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddProduct(token: widget.token)));
            },
          ),
          appBar: AppBar(
            foregroundColor: Assets.primaryColor,
            title: Text(title),
            backgroundColor: Assets.backgroundColor,
          ),
          drawer: SafeArea(
            child: Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text(
                      widget.token,
                      style: TextStyle(
                          fontFamily: Assets.mainFont,
                          fontSize: 30,
                          color: Assets.textColor),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const RedApp()));
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          fontFamily: Assets.mainFont,
                          fontSize: 20,
                          color: Assets.primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: Assets.backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Assets.primaryColor,
            iconSize: 30,
            selectedIconTheme:
                IconThemeData(color: Assets.primaryColor, size: 40),
            selectedItemColor: Assets.primaryColor,
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Assets.primaryColor,
                fontFamily: Assets.mainFont),
            unselectedIconTheme: IconThemeData(color: Assets.textColor),
            unselectedItemColor: Assets.textColor,
            unselectedLabelStyle:
                TextStyle(color: Assets.textColor, fontFamily: Assets.mainFont),
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Assets.backgroundColor,
                  icon: const Icon(Icons.menu_rounded),
                  label: "All Products"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.insert_emoticon_rounded),
                  label: "My Products"),
              const BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              )
            ],
            onTap: _onTapping,
          ),
          body: futureListViewBuilder()),
    );
  }

  Widget futureListViewBuilder() {
    return FutureBuilder(
        future: getProducts(title),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == false) {
            return Container();
          }
          return ListView.builder(
              itemCount: Products.length,
              itemBuilder: (BuildContext context, int i) {
                return Products[i];
              });
        });
  }

  void _onTapping(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        title = 'My Products';
      } else if (index == 2) {
        title = 'Favorites';
      } else {
        title = 'All Products';
      }
    });
  }
}
