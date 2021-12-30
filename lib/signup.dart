import 'package:flutter/material.dart';
import 'package:univ_project_1/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:univ_project_1/productspage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color passwordShadowColor = Assets.shadowColor;
  Color password2ShadowColor = Assets.shadowColor;
  Color usernameShadowColor = Assets.shadowColor;
  Color emailShadowColor = Assets.shadowColor;
  var error = "";
  String username = "";
  String password = "";
  String password2 = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Assets.backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Sign Up!',
                          style: TextStyle(
                            fontFamily: Assets.mainFont,
                            fontSize: 50,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(50,
                            MediaQuery.of(context).size.height / 10, 50, 10),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            50, MediaQuery.of(context).size.height / 10, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: usernameShadowColor,
                              )
                            ]),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              usernameShadowColor = Assets.tappedShadowColor;
                              emailShadowColor = Assets.shadowColor;
                              passwordShadowColor = Assets.shadowColor;
                              username = x;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: error,
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
                              'Username',
                              style: TextStyle(
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor,
                              ),
                            ),
                          ),
                        ),
                      ), //username
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
                                color: emailShadowColor,
                              )
                            ]),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              usernameShadowColor = Assets.shadowColor;
                              emailShadowColor = Assets.tappedShadowColor;
                              passwordShadowColor = Assets.shadowColor;
                              email = x;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: error,
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
                              'Email',
                              style: TextStyle(
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor,
                              ),
                            ),
                          ),
                        ),
                      ), //email
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
                                color: passwordShadowColor,
                              )
                            ]),
                        child: TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              usernameShadowColor = Assets.shadowColor;
                              emailShadowColor = Assets.shadowColor;
                              passwordShadowColor = Assets.tappedShadowColor;
                              password = x;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: error,
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
                              'Password',
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
                                color: passwordShadowColor,
                              )
                            ]),
                        child: TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              usernameShadowColor = Assets.shadowColor;
                              emailShadowColor = Assets.shadowColor;
                              passwordShadowColor = Assets.tappedShadowColor;
                              password2 = x;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: error,
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
                              'Password Conf',
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            ),
                          ),
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
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return Colors.deepPurple
                                          .withOpacity(0.04);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return const Color(0xFFFFDADB)
                                          .withOpacity(0.3);
                                    }
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () {
                                checkSignUp();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: Assets.mainFont,
                                ),
                              ))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              50,
                              MediaQuery.of(context).size.height * 0.4 / 10,
                              50,
                              0),
                          child: Text(
                            'App Name',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor),
                          )),
                    ],
                  ),
                ]),
              ),
            )));
  }

  Future<void> checkSignUp() async {
    var map = <String, dynamic>{};
    map['name'] = username;
    map['email'] = email;
    map['password'] = password;
    map['password confirmation'] = password2;
    final response = await http.post(Uri.parse(Assets.link + "register"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/json"
        },
        encoding: Encoding.getByName('utf-8'),
        body: map);
    Map<String, dynamic> resp = jsonDecode(response.body);
    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MainPage(
                  token: resp["token"].toString(), id: resp["id"].toString())));
    } else if (response.statusCode == 422) {
      if (resp["errors"]["email"] != null) {
        setState(() {
          emailShadowColor = Assets.errorShadowColor;
          error = resp["errors"]["email"].toString();
        });
      }
      if (resp["errors"]["name"] != null) {
        setState(() {
          usernameShadowColor = Assets.errorShadowColor;
          error = resp["errors"]["name"].toString();
        });
      }
      if (resp["errors"]["password"] != null) {
        setState(() {
          passwordShadowColor = Assets.errorShadowColor;
          error = resp["errors"]["password"].toString();
        });
      }
    }
  }
}
