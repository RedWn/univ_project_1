import 'dart:async';
import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:univ_project_1/addproduct.dart';
import 'package:univ_project_1/editproduct.dart';
import 'package:univ_project_1/showproduct.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product(
      {Key? key,
      required this.img,
      required this.text,
      required this.state,
      required this.token,
      required this.id})
      : super(key: key);
  final Image img;
  final String text;
  final String state;
  final String token;
  final String id;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  IconData icon = Icons.search;

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
            widget.img,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: Assets.mainFont,
                      color: Assets.textColor,
                      height: 2),
                ),
                TextButton.icon(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.deepPurple.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.deepPurple.withOpacity(0.5);
                          }
                        }),
                        foregroundColor:
                            MaterialStateProperty.all(Assets.primaryColor)),
                    onPressed: () {
                      _onLiking();
                    },
                    icon: Icon(icon),
                    label: const Text("Like"))
              ],
            ),
          ]),
          onPressed: () {
            if (widget.state == "My Products") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProduct(
                            token: widget.token,
                            id: widget
                                .id, //TODO fix the two steps back and refresh the page when you come back (.then maybe??)
                          )));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowProduct(
                            id: widget.id,
                          )));
            }
          },
        ));
  }

  Future<void> _onLiking() async {
    var map = <String, dynamic>{};
    map['id'] = widget.id;
    setState(() {
      icon = Icons.search;
    });
    final response = await http.post(Uri.parse(Assets.link + "addlike"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          'Authorization': 'Bearer ${widget.token}',
        },
        body: map);
    print(response.body);
  }
}

class MainPage extends StatefulWidget {
  final String token;
  final String id;
  const MainPage({Key? key, required this.token, required this.id})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> getAll() async {
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
          token: widget.token,
          id: resp[i]["id"].toString(),
          state: title);
      products.add(temp);
    }
  }

  Future<void> getMy() async {
    var tok = widget.token;
    final response = await http.get(
      Uri.parse(Assets.link + "myProduct"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        'Authorization': 'Bearer $tok',
        "id": widget.id
      },
    );
    print(response.body);
    List<dynamic> resp =
        jsonDecode(response.body); //TODO: search single clients
    print(response.body);
    for (int i = 0; i < resp.length; i++) {
      Product temp = Product(
          img: Image.asset(resp[i]["image"]),
          text: resp[i]["name"],
          token: widget.token,
          id: resp[i]["id"].toString(),
          state: title);
      products.add(temp);
    }
  }

  Future<void> getSearch(String mode) async {
    String link = "products/searchByName/$searched";
    if (mode == "Category") {
      link = "products/searchByCategory/$searched";
    } else if (mode == "Exp. Date") {
      link = "products/searchByExp_date/$searched";
    }
    final response = await http.get(
      Uri.parse(Assets.link + link),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      },
    );
    List<dynamic> resp =
        jsonDecode(response.body); //TODO: search single clients
    print(response.body);
    for (int i = 0; i < resp.length; i++) {
      Product temp = Product(
          img: Image.asset(resp[i]["image"]),
          text: resp[i]["name"],
          token: widget.token,
          id: resp[i]["id"].toString(),
          state: title);
      products.add(temp);
    }
  }

  Future<List<Product>> getProducts(String mode) async {
    products = [];
    if (mode == 'All Products') {
      await getAll();
    } else if (mode == 'My Products') {
      await getMy();
    } else if (mode == 'Search') {
      await getSearch(dropdownValue);
    }
    return products;
  }

  int _selectedIndex = 0;
  String searched = "";
  String title = 'All Products';
  List<Product> products = [];
  Widget customSearchBar = Text('All Products');
  String dropdownValue = 'Name';

  @override
  Widget build(BuildContext context) {
    if (title == "Search") {
      setState(() {
        customSearchBar = ListTile(
          leading: DropdownButton<String>(
            value: dropdownValue,
            borderRadius: BorderRadius.circular(Assets.roundCorners),
            elevation: 16,
            style: TextStyle(
              color: Assets.primaryColor,
              fontFamily: Assets.mainFont,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                // mode = dropdownValue;
              });
            },
            items: <String>['Name', 'Category', 'Exp. Date']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          title: TextField(
            onChanged: (String x) {
              searched = x;
            },
            decoration: InputDecoration(
              hintText: 'type here...',
              hintStyle: TextStyle(
                color: Assets.primaryColor,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Assets.primaryColor,
            ),
          ),
          trailing: IconButton(
            iconSize: 25,
            color: Assets.primaryColor,
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                title = 'Search';
              });
            },
          ),
        );
      });
    }
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
              elevation: 8,
              shadowColor: Assets.primaryColor,
              foregroundColor: Assets.primaryColor,
              title: customSearchBar,
              backgroundColor: Assets.backgroundColor,
              centerTitle: true,
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
              elevation: 15,
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
              unselectedLabelStyle: TextStyle(
                  color: Assets.textColor, fontFamily: Assets.mainFont),
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
                  icon: Icon(Icons.search),
                  label: "Search",
                )
              ],
              onTap: _onTapping,
            ),
            body: futureListViewBuilder()),
      ),
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
              itemCount: products.length,
              itemBuilder: (BuildContext context, int i) {
                return products[i];
              });
        });
  }

  void _onTapping(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        title = 'My Products';
        customSearchBar = Text(title);
      } else if (index == 2) {
        title = 'Search';
      } else {
        title = 'All Products';
        customSearchBar = Text(title);
      }
    });
  }
}
