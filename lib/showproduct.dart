import 'dart:convert';

import 'package:univ_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowProduct extends StatefulWidget {
  final String id;
  final String token;
  const ShowProduct({Key? key, required this.id, required this.token})
      : super(
          key: key,
        );

  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  Map<String, dynamic> ans = {};
  String comment = "";
  List<dynamic> resp = [];
  Future getpost() async {
    var response = await http.get(
      Uri.parse(Assets.link + "showDetails" + "/" + widget.id),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
      },
    );
    var responsebody = jsonDecode(response.body);
    ans['name'] = responsebody["name"];
    ans['image'] = responsebody["image"];
    ans['price'] = responsebody["price"];
    ans['quantity'] = responsebody["quantity"];
    ans['exp_date'] = responsebody["exp_date"];
    for (int i = 1; i < 4; i++) {
      ans["discount_date_$i"] = responsebody["discount_date_$i"];
      ans["discount_value_$i"] = responsebody["discount_value_$i"];
    }
    ans['contact_info'] = responsebody["contact_info"];
    ans["image"] = responsebody["image"];
    ans["views"] = responsebody["views"].toString();
    ans["likes"] = responsebody["likes"].toString();
    ans["category"] = responsebody["category"];
    responsebody['image'] =
        responsebody['image'].toString().replaceAll("public/", "");
    responsebody['image'] =
        responsebody['image'].toString().replaceAll("storage/", "");
    ans['image'] = responsebody['image'];
    return responsebody;
  }

  // int ind = geti();
  @override
  Widget build(BuildContext context) {
    Color shadow = Assets.shadowColor;
    // print((Assets.picLink + ans['image']));
    final controller = PageController(initialPage: 1);

    return PageView(
      controller: controller,
      onPageChanged: (var x) {
        setState(() {});
      },
      children: [
        FutureBuilder(
            future: getpost(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Directionality(
                  textDirection: Assets.rtlState(),
                  child: Scaffold(
                    backgroundColor: Assets.backgroundColor,
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            Image.network(Assets.picLink + ans['image']),
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
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Assets.roundCorners)),
                                      color: Assets.primaryColor),
                                  margin:
                                      const EdgeInsets.fromLTRB(80, 5, 10, 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Views:  " + ans["views"],
                                          style: TextStyle(
                                            color: Assets.lightTextColor,
                                            fontFamily: Assets.mainFont,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 5, 80, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Assets.roundCorners)),
                                      color: Assets.primaryColor),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Likes: " + ans["likes"],
                                          style: TextStyle(
                                            color: Assets.lightTextColor,
                                            fontFamily: Assets.mainFont,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Expanded(child: futureListViewBuilder()),
                            Column(
                              children: [
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
                                    textInputAction: TextInputAction.next,
                                    onChanged: (String x) {
                                      setState(() {
                                        shadow = Assets.tappedShadowColor;
                                      });
                                      comment = x;
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Assets.textColor,
                                      fontSize: 15,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                      border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(Assets.roundCorners),
                                      )),
                                      focusedBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Assets.roundCorners),
                                          ),
                                          borderSide: BorderSide(
                                            color: Assets.primaryColor,
                                            width: 0.01,
                                          )),
                                      filled: true,
                                      fillColor: Assets.backgroundColor
                                          .withOpacity(0.9),
                                      label: Text(
                                        'Write a comment',
                                        style: TextStyle(
                                          fontFamily: Assets.mainFont,
                                          color: Assets.textColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      addComment();
                                      controller.nextPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.decelerate);
                                    },
                                    icon: const Icon(Icons.arrow_forward))
                              ],
                            ), //password
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
        futureListViewBuilder(),
        // Text("data"),
      ],
    );
  }

  Widget futureListViewBuilder() {
    return FutureBuilder(
        future: getComments(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == false) {
            return const CircularProgressIndicator();
          }
          return Scaffold(
            body: SafeArea(
              child: ListView.builder(
                  itemCount: resp.length,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  itemBuilder: (BuildContext context, int i) {
                    return Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Comment ${i + 1}: ',
                            style: TextStyle(
                                color: Assets.primaryColor,
                                fontFamily: Assets.mainFont,
                                fontSize: 25),
                          ),
                          Text(
                            resp[i]['comment'],
                            style: TextStyle(
                                color: Assets.textColor,
                                fontFamily: Assets.mainFont,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: Assets.textColor,
                      ),
                    ]);
                  }),
            ),
          );
        });
  }

  Future<void> getComments() async {
    final response = await http.get(
      Uri.parse(Assets.link + "showDetails/${widget.id}/showComments"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    resp = jsonDecode(response.body);
  }

  Future<void> addComment() async {
    var map = <String, dynamic>{};
    map["comment"] = comment;
    String tok = widget.token;
    final response = await http.post(
        Uri.parse(Assets.link + "showDetails/${widget.id}/addComment"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          'Authorization': 'Bearer $tok',
        },
        encoding: Encoding.getByName('utf-8'),
        body: map);
  }
}
