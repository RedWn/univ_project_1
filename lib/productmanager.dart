import 'dart:convert';

import 'package:test4/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:test4/productspage.dart';

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
  String date = "";
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
                    Container(
                      width: MediaQuery.of(context).size.width/2,
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
                        child: Text('Upload Image', style: TextStyle(fontFamily: Assets.mainFont),),
                        onPressed: () async {
                          image = await picker.pickImage(source: ImageSource.gallery);
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
                    ),//name
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(50, 0, 15, 0),
                          width: MediaQuery.of(context).size.width/3,
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
                        ),//price
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 50, 0),
                          width: MediaQuery.of(context).size.width/3,
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
                        ),//quantity
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
                    ),//num
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
                              date = x;
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
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
                              add();
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

  Future<void> add() async {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['quantity'] = name;
    map['exp_date'] = date;
    map['contact_info'] = num;
    map["image"] = "image";
    map["category"] = "AAA";
    String tok = widget.token;
    final response = await http.post(Uri.parse(Assets.link + "store"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
        'Authorization': 'Bearer $tok',
        },
        encoding: Encoding.getByName('utf-8'),
        body: map);
    Map<String, dynamic> resp = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MainPage(token: widget.token)));
    } else if (response.statusCode == 401) {
      print("shit shit");
    }
  }
  void auto(){
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MainPage(token: "name")));
  }
}

class ShowProduct extends StatefulWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl, child: Scaffold(

      appBar: AppBar(
        title: Text('details'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 200,
                height: 200,
                image: AssetImage('images/scopinal.jpg'),
              ),
              SizedBox(
                height: 30,),
              Container(
                padding:EdgeInsets .all(5.0),
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 80.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [

                      /*Icon(
                      Icons.person_add,
                      color:Colors.indigo,
                    ),*/
                      SizedBox(
                        width: 10,
                      ),
                      Text(  'name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                          fontSize:20,

                        ),
                      ),
                      SizedBox(
                        height: 30,),

                    ]),
              ),

              Container(
                padding:EdgeInsets .all(5.0),
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 80.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [


                      SizedBox(
                        width: 10,
                      ),
                      Text(  'price' ,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                          fontSize:20,

                        ),
                      ),
                      SizedBox(
                        height: 30,),

                    ]),
              ),

              Container(
                padding:EdgeInsets .all(5.0),
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 80.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [

                      SizedBox(
                        width: 10,
                      ),

                      Text('11/12/2022',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                          fontSize:20,

                        ),
                      ),
                      SizedBox(
                        height: 30,),

                    ]),
              ),
              Container(
                padding:EdgeInsets .all(5.0),
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 80.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [

                      SizedBox(
                        width: 10,
                      ),

                      Text('ahmad',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                          fontSize:20,

                        ),
                      ),
                      SizedBox(
                        height: 30,),

                    ]),
              ),
              Container(
                padding:EdgeInsets .all(5.0),
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 80.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [

                      SizedBox(
                        width: 10,
                      ),

                      Text('09548755',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'BalooBhaijaan2-VariableFont_wght',
                          fontSize:20,

                        ),
                      ),
                      SizedBox(
                        height: 30,),

                    ]),
              ),

            ] ),
      ),
    )
    );
  }
}

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  Color nameShadowColor = Assets.shadowColor;
  Color priceShadowColor = Assets.shadowColor;
  Color numShadowColor = Assets.shadowColor;
  Color quantityShadowColor = Assets.shadowColor;
  XFile? image;
  ImagePicker picker = ImagePicker();
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
                    'Edit product',
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
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
                        child: Text('Upload Image', style: TextStyle(fontFamily: Assets.mainFont),),
                        onPressed: () async {
                          image = await picker.pickImage(source: ImageSource.gallery);
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(50, 0, 15, 0),
                          width: MediaQuery.of(context).size.width/3,
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
                                'Price',
                                style: TextStyle(
                                  fontFamily: Assets.mainFont,
                                  color: Assets.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 50, 0),
                          width: MediaQuery.of(context).size.width/3,
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
                                'Quantity',
                                style: TextStyle(
                                  fontFamily: Assets.mainFont,
                                  color: Assets.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
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
                            onPressed: () {
                              //auto();
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                              ),
                            )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red),
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
                            onPressed: () {
                              //auto();
                            },
                            child: Text(
                              'DELETE',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                              ),
                            )
                        ),
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

  void auto(){
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MainPage(token: "name")));
  }
  getProductInfo() async {

  }
}


