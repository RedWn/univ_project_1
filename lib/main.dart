import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test4/productspage.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class Assets {
  static bool darkMode = false;
  static Color primaryColor = const Color(0xFF6750a4);
  static Color secondaryColor = const Color(0xFF765656);
  static Color textColor = const Color(0xFF303030);
  static Color accentColor = const Color(0xFF765A2F);
  static Color backgroundColor = const Color(0xFFF1F3F6);
  static Color lightTextColor = const Color(0xFFF1F3F6);
  static Color tappedShadowColor = Assets.primaryColor.withOpacity(0.5);
  static Color errorShadowColor = Colors.red.shade400;
  static Color shadowColor = Colors.grey.shade400;
  static double roundCorners = 12;
  static String mainFont = 'Varela';
  static String link = "http://127.0.0.1:8000/api/";
  static String link2 = "https://410c09a9-1200-4123-baa1-53834038eac7.mock.pstmn.io/register";

  static void enableDarkMode() {
    primaryColor = const Color(0xFFAF2D3C);
    secondaryColor = const Color(0xFF765656);
    textColor = const Color(0xFFF1F3F6);
    accentColor = const Color(0xFF765A2F);
    backgroundColor = const Color(0xFF303030);
    shadowColor = Colors.grey.shade800;
    tappedShadowColor = Assets.primaryColor.withOpacity(0.5);
  }

  static void disableDarkMode() {
    primaryColor = const Color(0xFFAF2D3C);
    secondaryColor = const Color(0xFF765656);
    textColor = const Color(0xFF303030);
    accentColor = const Color(0xFF765A2F);
    backgroundColor = const Color(0xFFF1F3F6);
    shadowColor = Colors.grey.shade400;
    tappedShadowColor = Assets.primaryColor.withOpacity(0.5);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RedApp(),
    );
  }
}

class RedApp extends StatelessWidget {
  const RedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Assets.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 50),
                    child: Image.asset('Assets/Icon.png'),
                  ),
                  Container(
                    child: Text(
                      'App Pharma',
                      style: TextStyle(
                        fontFamily: Assets.mainFont,
                        fontSize: 60,
                        color: Assets.textColor,
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          50, MediaQuery.of(context).size.height / 10, 50, 0),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Assets.primaryColor),
                            foregroundColor:
                                MaterialStateProperty.all(Assets.textColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(//RedWn was here
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.deepPurple.withOpacity(0.04);
                                }
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return const Color(0xFFFFDADB);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                                color: Assets.backgroundColor),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Assets.primaryColor),
                            foregroundColor: MaterialStateProperty.all(
                              Assets.backgroundColor,
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            shadowColor: MaterialStateProperty.all(
                                const Color(0xFF000000)),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.deepPurple.withOpacity(0.04);
                                }
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return const Color(0xFFFFDADB);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignUp()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: Assets.mainFont,
                            ),
                          ))),
                  Container(
                      margin: EdgeInsets.fromLTRB(50,
                          MediaQuery.of(context).size.height * 2 / 10, 50, 0),
                      child: Text(
                        'Team Names',
                        style: TextStyle(
                            fontFamily: Assets.mainFont,
                            color: Assets.backgroundColor,
                            fontSize: 20),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color passwordShadowColor = Assets.shadowColor;
  Color emailShadowColor = Assets.shadowColor;
  String email = "";
  String password = "";
  String error = "";
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
                          'Welcome Back!',
                          style: TextStyle(
                            fontFamily: Assets.mainFont,
                            fontSize: 50,
                            color: Assets.textColor,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(
                            50, MediaQuery.of(context).size.height / 10, 50, 0),
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
                                color: emailShadowColor,
                              )
                            ]),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          onChanged: (String x) {
                            setState(() {
                              emailShadowColor = Assets.tappedShadowColor;
                              passwordShadowColor = Assets.shadowColor;
                              email = x;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
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
                              emailShadowColor = Assets.shadowColor;
                              passwordShadowColor = Assets.tappedShadowColor;
                            });
                            password = x;
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
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
                      ), //password
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
                                          .withOpacity(0.5);
                                    }
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onLongPress: (){
                                autoLogin();
                              },
                              onPressed: () {
                                checkLogin();
                                // autoLogin();
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: Assets.mainFont,
                                ),
                              ))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              50,
                              MediaQuery.of(context).size.height * 0.5 / 10,
                              50,
                              0),
                          child: Text(
                            'App Name',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor),
                          )),
                    ],
                  ),
                ]),
              ),
            )));
  }

  Future<void> checkLogin() async {
    var map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    final response = await http.post(Uri.parse(Assets.link + "login"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/json"
        },
        encoding: Encoding.getByName('utf-8'),
        body: map);
    Map<String, dynamic> resp = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MainPage(token: resp["token"].toString())));
    } else if (response.statusCode == 422) {
      if (resp["errors"]["email"] != null) {
        setState(() {
          emailShadowColor = Assets.errorShadowColor;
          error = resp["errors"]["email"].toString();
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

  void autoLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const MainPage(token: "name")));
  }
}

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
              builder: (_) => MainPage(token: resp["token"].toString())));
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
